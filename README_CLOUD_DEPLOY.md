# V104.6 精簡雲端版部署說明

這包已刪除用不到的本機啟動檔、快取檔與舊輸出檔，只保留雲端部署與執行必要內容。

## 保留內容

- `v1046_server.py`：雲端 Web App 入口。
- `v1046_cloud_daily_risk_guard.py`：策略與 dashboard 產生核心。
- `requirements.txt`：Python 套件。
- `render.yaml`、`Procfile`、`runtime.txt`：Render / Gunicorn 部署設定。
- `config/`：設定與股票清單。
- `data/`：本地歷史資料與台指夜盤手動資料。
- `state/`：紙上交易狀態，不能刪。
- `output/.keep`、`logs/.keep`：保留空資料夾，實際輸出會上線後重新產生。

## 已刪除內容

- Windows 本機用 `.cmd` 檔。
- 舊版 README / README_FIRST。
- `__pycache__` 與 `.pyc` 快取。
- 舊的 `output/` 產生檔，包含舊 dashboard、舊推薦 CSV、舊健康報告。

## 雲端功能

- `/`：首頁 / dashboard，打開網頁會自動觸發一次更新。
- `/api/run?mode=real`：手動啟動正式流程。
- `/api/run?mode=demo`：手動啟動 DEMO 流程，不寫入正式紙上持倉。
- `/api/status`：查看目前或最近一次執行狀態。
- `/files`：下載 output / state / config / logs 裡的重要檔案。
- `/health`：健康檢查頁。
- `/healthz`：平台健康檢查 JSON。

## Render 部署

本包已內建 `render.yaml`，可用 Blueprint 部署。

```text
Build Command:
pip install --upgrade pip && pip install -r requirements.txt

Start Command:
gunicorn v1046_server:app --workers 1 --threads 4 --timeout 300 --bind 0.0.0.0:$PORT
```

建議環境變數：

```text
PYTHON_VERSION=3.11.9
TZ=Asia/Taipei
PUBLIC_BASE_URL=https://你的服務網址
V1046_RUN_TOKEN=自行設定一組密碼，可留空
V1046_AUTO_RUN_ON_OPEN=true
V1046_AUTO_RUN_MODE=real
V1046_AUTO_OPEN_COOLDOWN_SECONDS=600
```

如果有設定 `V1046_RUN_TOKEN`，啟動正式或 DEMO 時需要在 query string 或 header 帶入 token：

```text
/api/run?mode=real&token=你的密碼
/api/run?mode=demo&token=你的密碼
```

## 打開網頁自動更新

預設 `V1046_AUTO_RUN_ON_OPEN=true`，所以打開首頁 `/` 會自動啟動一次正式更新；前端會輪詢 `/api/status`，完成後自動重新載入最新 dashboard。

為避免重新載入後又重跑，已加入冷卻時間：`V1046_AUTO_OPEN_COOLDOWN_SECONDS=600`。若只想測試，可把 `V1046_AUTO_RUN_MODE` 改成 `demo`。若某次只想看靜態頁，可以打開 `/?auto=0`。

## 本機測試

```bash
pip install -r requirements.txt
python v1046_server.py
```

打開：

```text
http://localhost:10000/
```

## 注意

雲端免費方案的檔案系統通常不是永久儲存。這包保留 `data/` 與 `state/` 作為初始狀態；`output/` 會在雲端第一次更新後重新產生。
