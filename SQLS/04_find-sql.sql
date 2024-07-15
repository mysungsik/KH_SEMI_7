-- 1. 유저 정보 출력
SELECT 
	USER_NO,
	TEAM_NO,
	USER_ID,
	USER_EMAIL ,
	USER_NAME,
	USER_PHONE,
	USER_SNS,
	TO_CHAR(USER_BD, 'YYYYMMDD') AS USER_BD,
	USER_ADDRESS,
	USER_GENDER ,
	USER_NATION ,
    USER_IMG_ORIGIN ,
    USER_IMG_RENAME,
	USER_AUTHORITY ,
	USER_ST ,
	TO_CHAR(CREATE_DT, 'YYYY-MM-DD HH24:MM:SS') AS CREATE_DT,
    TO_CHAR(DELETE_DT, 'YYYY-MM-DD HH24:MM:SS') AS DELETE_DT
FROM USER_INFO
WHERE USER_ID = 'sportsAdmin'
AND USER_PW = 'KQZ3dpm+3daZEkqDpEvtnk6AMuxOJ22ZNR1WmZoxVVq+5YWwAZ+SflpCH26gc3X2nVzfL1zre30F+jsMxgowaw=='
AND DELETE_DT IS NULL;

SELECT * FROM USER_POLICY;

-- 2. SESSION 정보 출력
SELECT * FROM USER_SESSION;

SELECT USER_ID, USER_PW, S.SESSION_UUID FROM USER_INFO U
JOIN USER_SESSION S ON (U.USER_NO = S.USER_NO)
WHERE S.SESSION_UUID = '4267a216-6e30-47e7-8856-74dd130acf37';