/*
Frosty Friday, week 47: https://frostyfriday.org/blog/2023/05/26/week-47-basic/
*/



/*
事前準備
*/

-- ロールの設定
USE ROLE accountadmin;

-- ウェアハウスの作成
CREATE WAREHOUSE IF NOT EXISTS frosty_friday_wh
    WAREHOUSE_SIZE = 'x-small'
    AUTO_SUSPEND = 300
    AUTO_RESUME = true
    INITIALLY_SUSPENDED = true;

-- データベースの作成
CREATE DATABASE frosty_friday;

-- スキーマの作成
CREATE SCHEMA frosty_friday.week_47;

-- テーブルの作成
CREATE TABLE IF NOT EXISTS frosty_tag_table (
    key int,
    value string
);

-- タグの作成
CREATE TAG purpose;



/*
今回のチャレンジ：Snowsightインターフェースを操作して、frosty_tag_tableに "FrostyFriday" の値でタグを設定する。

参考:
タグの作成および割り当て: https://docs.snowflake.com/ja/user-guide/object-tagging#create-and-assign-tags
*/



/*
設定されているかの確認
*/

-- チェッククエリ
SELECT SYSTEM$GET_TAG('purpose', 'frosty_tag_table', 'table');



/*
Appendix
*/

-- SQLバージョン
ALTER TABLE frosty_friday.week_47.frosty_tag_table SET TAG purpose = 'FrostyFriday';


-- タグのモニタリング
SELECT * FROM snowflake.account_usage.tags;
