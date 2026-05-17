# V104.6 Official BIGLOSS + MSTOP Daily

這版固定使用你指定的兩個正式風控：

## 正式風控

### 台股：V104.6 MSTOP_06_LOSS2_CD5
- 原 V104.3.1 台股核心規則：Top1 / Max5 / H15 / Stop -12%
- 當月已實現損益 <= -6%：本月停止新增台股
- 連續虧損 2 筆：冷卻 5 天不新增台股
- 已持倉仍照 STOP / SELL_DUE 出場

### 美股：V104.6 BIGLOSS_08_CD5
- 原 V104.3.1 美股核心規則：Top1 / Max2 / H10 / Stop -10%
- 單筆已實現虧損 <= -8%：冷卻 5 天不新增美股
- 已持倉仍照 STOP / SELL_DUE 出場

## 每天正式跑

雙擊：

```bat
RUN_V1046_OFFICIAL_DAILY.bat
```

或原本這個也可以：

```bat
RUN_V1046_REAL_DAILY.bat
```

## 跑完看

```text
output/v1046_paper_dashboard.html
output/v1046_today_recommendations_SIMPLE.csv
output/v1046_risk_guard_status.csv
state/v1046_paper_positions.csv
state/v1046_paper_closed_trades.csv
```

## 注意

這版不是 5% ultra-low-DD 版本，也不是 MAXPOS_1 / MAXPOS_5 版本。
正式只採用：

```text
TW_MSTOP_06_LOSS2_CD5
US_BIGLOSS_08_CD5
```
