

# 지정 위치 내 총 파일 사이즈 확인
find '.' -name '*.wav' -print0 | du --files0-from=- -ch 
