<!doctype html>
<html lang="zh-Hant">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>V104.6 Google Sheets 預填版部署說明</title>
<style>
body{margin:0;background:#eef2f6;color:#172033;font-family:"Microsoft JhengHei",Arial,sans-serif;line-height:1.7}
.wrap{max-width:980px;margin:0 auto;padding:24px}
.card{background:#fffdf7;border:1px solid #dde4dc;border-radius:18px;margin:16px 0;padding:18px;box-shadow:0 8px 24px rgba(15,23,42,.06)}
h1,h2{margin:0 0 10px}code,pre{background:#0f172a;color:#e5e7eb;border-radius:12px}pre{padding:14px;overflow:auto;white-space:pre-wrap}code{padding:2px 6px}
.ok{color:#15803d;font-weight:900}.warn{color:#b45309;font-weight:900}
</style>
</head>
<body>
<div class="wrap">
  <div class="card">
    <h1>V104.6 Google Sheets 預填版</h1>
    <p class="ok">這包已經把 Sheet ID、Sheets 開關、同步設定、首頁自動更新都預填好了。</p>
    <p>你只需要在 Render Environment 補 <code>V1046_GOOGLE_SERVICE_ACCOUNT_JSON</code>。</p>
  </div>

  <div class="card">
    <h2>已預填的 Google Sheet</h2>
    <pre>V1046_GOOGLE_SHEET_ID=1EiilvPfQBvrDwh1BZHXNR7Ech29h0kW9XoM_gt8qbsg</pre>
  </div>

  <div class="card">
    <h2>Render Environment 懶人包</h2>
    <pre># V104.6 Render Environment 懶人包
# Sheet ID 已填你的 Google Sheet：1EiilvPfQBvrDwh1BZHXNR7Ech29h0kW9XoM_gt8qbsg
# 你只需要把 V1046_GOOGLE_SERVICE_ACCOUNT_JSON 的值換成整份 service account JSON。
# 不要把 JSON 傳到 GitHub。只貼 Render Environment。

PYTHON_VERSION=3.11.9
TZ=Asia/Taipei
PUBLIC_BASE_URL=https://v1046-cloud-daily-risk-guard.onrender.com

V1046_AUTO_RUN_ON_OPEN=true
V1046_AUTO_RUN_MODE=real
V1046_AUTO_OPEN_COOLDOWN_SECONDS=600

V1046_SHEETS_ENABLED=true
V1046_GOOGLE_SHEET_ID=1EiilvPfQBvrDwh1BZHXNR7Ech29h0kW9XoM_gt8qbsg
V1046_GOOGLE_SERVICE_ACCOUNT_JSON=這裡貼你整份JSON金鑰，從第一個 { 到最後一個 }

V1046_SHEETS_STATE_ENABLED=true
V1046_SHEETS_OUTPUT_ENABLED=true
V1046_SHEETS_LOCK_ENABLED=true
V1046_SHEETS_LOCK_TTL_SECONDS=900

# 選填：手動執行 API 密碼。要用就取消註解並填自己的密碼。
# V1046_RUN_TOKEN=你自己的密碼
</pre>
  </div>

  <div class="card">
    <h2>你要做的最後一步</h2>
    <p>打開 service account JSON，複製整份內容，貼到 Render Environment：</p>
    <pre>V1046_GOOGLE_SERVICE_ACCOUNT_JSON=整份 JSON</pre>
    <p class="warn">不要把 JSON 貼到 GitHub，也不要傳給別人。</p>
  </div>

  <div class="card">
    <h2>測試</h2>
    <pre>https://v1046-cloud-daily-risk-guard.onrender.com/api/sheets/status?check=1</pre>
    <p>成功會看到 <code>connect_ok: true</code>。</p>
  </div>
</div>
</body>
</html>
