<!doctype html>
<html lang="zh-Hant">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>V104.6 精簡雲端版部署包</title>
<style>
:root{--bg:#eef2f6;--card:#fffdf7;--line:#dde4dc;--text:#243447;--muted:#64748b;--head:#eef1e6;--blue:#2563eb;--green:#047857;--warn:#92400e;--red:#b91c1c}
*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--text);font-family:'Microsoft JhengHei',Arial,sans-serif}.wrap{max-width:1040px;margin:auto;padding:18px}.card{background:var(--card);border:1px solid var(--line);border-radius:18px;margin:14px 0;padding:18px;box-shadow:0 8px 24px rgba(15,23,42,.06)}h1{margin:0 0 8px;font-size:28px}h2{margin:0 0 12px;font-size:20px}.sub{color:var(--muted);line-height:1.7}.grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:10px}.pill{border-radius:14px;border:1px solid var(--line);background:#f8fafc;padding:12px}.pill b{display:block;margin-bottom:5px}code,pre{font-family:Consolas,Menlo,monospace}pre{background:#0f172a;color:#e2e8f0;border-radius:14px;padding:14px;overflow:auto}.ok{border-left:5px solid var(--green)}.warn{border-left:5px solid var(--warn)}.danger{border-left:5px solid var(--red)}table{border-collapse:collapse;width:100%;font-size:14px}th,td{border-bottom:1px solid #e2e8d7;padding:8px;text-align:left;vertical-align:top}th{background:var(--head)}@media(max-width:760px){.grid{grid-template-columns:1fr}.wrap{padding:10px}}
</style>
</head>
<body>
<div class="wrap">
  <div class="card ok">
    <h1>V104.6 精簡雲端版部署包</h1>
    <div class="sub">這份壓縮包已刪除用不到的本機檔、快取檔與舊輸出檔，只保留雲端部署必要內容。上線後打開首頁會自動更新，完成後自動重新載入最新 dashboard。</div>
  </div>

  <div class="card">
    <h2>保留內容</h2>
    <table><thead><tr><th>項目</th><th>用途</th></tr></thead><tbody>
      <tr><td><code>v1046_server.py</code></td><td>Flask Web App 入口，含首頁自動更新、狀態 API、檔案下載。</td></tr>
      <tr><td><code>v1046_cloud_daily_risk_guard.py</code></td><td>策略核心與 dashboard 產生。</td></tr>
      <tr><td><code>config/</code></td><td>設定與股票清單。</td></tr>
      <tr><td><code>data/</code></td><td>本地歷史資料與台指夜盤手動資料。</td></tr>
      <tr><td><code>state/</code></td><td>紙上交易狀態，已保留。</td></tr>
      <tr><td><code>output/.keep</code>、<code>logs/.keep</code></td><td>保留空資料夾；上線後會重新產生輸出。</td></tr>
    </tbody></table>
  </div>

  <div class="card danger">
    <h2>已刪除</h2>
    <div class="grid">
      <div class="pill"><b>Windows .cmd</b>雲端用不到</div>
      <div class="pill"><b>舊 README</b>只保留雲端版說明</div>
      <div class="pill"><b>__pycache__ / .pyc</b>Python 快取</div>
      <div class="pill"><b>舊 output</b>舊 dashboard、舊 CSV、舊健康報告</div>
      <div class="pill"><b>舊本機開啟檔</b>不影響 Render</div>
      <div class="pill"><b>暫存測試輸出</b>避免部署包混入測試結果</div>
    </div>
  </div>

  <div class="card">
    <h2>主要入口</h2>
    <div class="grid">
      <div class="pill"><b>/</b>首頁 / dashboard + 開頁自動更新</div>
      <div class="pill"><b>/files</b>下載 output / state / config 檔</div>
      <div class="pill"><b>/health</b>健康檢查</div>
      <div class="pill"><b>/api/run?mode=real</b>啟動正式流程</div>
      <div class="pill"><b>/api/run?mode=demo</b>啟動 DEMO 流程</div>
      <div class="pill"><b>/api/status</b>查看執行狀態</div>
    </div>
  </div>

  <div class="card">
    <h2>Render 設定</h2>
<pre>Build Command:
pip install --upgrade pip && pip install -r requirements.txt

Start Command:
gunicorn v1046_server:app --workers 1 --threads 4 --timeout 300 --bind 0.0.0.0:$PORT</pre>
    <div class="sub">本包已包含 <code>render.yaml</code>，可直接用 Blueprint 或手動建立 Web Service。</div>
  </div>

  <div class="card">
    <h2>環境變數</h2>
    <table><thead><tr><th>Key</th><th>建議值</th><th>用途</th></tr></thead><tbody>
      <tr><td>PYTHON_VERSION</td><td>3.11.9</td><td>固定 Python 版本</td></tr>
      <tr><td>TZ</td><td>Asia/Taipei</td><td>台灣時間</td></tr>
      <tr><td>PUBLIC_BASE_URL</td><td>你的雲端網址</td><td>狀態 API 回傳用，可留空</td></tr>
      <tr><td>V1046_RUN_TOKEN</td><td>自行設定</td><td>保護手動跑正式 / DEMO 的按鈕，可留空</td></tr>
      <tr><td>V1046_AUTO_RUN_ON_OPEN</td><td>true</td><td>打開首頁自動更新</td></tr>
      <tr><td>V1046_AUTO_RUN_MODE</td><td>real</td><td>開頁自動跑正式；可改 demo 測試</td></tr>
      <tr><td>V1046_AUTO_OPEN_COOLDOWN_SECONDS</td><td>600</td><td>避免重新載入或多人打開時連續重跑</td></tr>
    </tbody></table>
  </div>

  <div class="card warn">
    <h2>重要注意</h2>
    <div class="sub"><code>output/</code> 已清空，只保留 <code>.keep</code>。第一次打開雲端首頁時會自動更新並重新產生 dashboard 與 CSV。免費雲端平台常見的檔案系統不是永久儲存，重新部署時會回到部署包內的 <code>data/</code> 與 <code>state/</code> 初始狀態。</div>
  </div>
</div>
</body>
</html>
