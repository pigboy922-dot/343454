# V104.6 Cloud Google Sheets

必要環境變數已寫在 `render.yaml`，只需要到 Render 補上：

```text
V1046_GOOGLE_SERVICE_ACCOUNT_JSON=你的 Google service account JSON
```

並確認 Google Sheet 已分享給 JSON 內的 `client_email`，權限為編輯者。

測試：

```text
/api/sheets/status?check=1
```

看到 `connect_ok: true` 代表 Google Sheets 同步成功。
