#!/bin/bash

log_f="/var/log/monitoring.log"
p_name="test"
url="https://test.com/monitoring/test/api"

pid=$(pgrep -n "$p_name")

if [ -z "$pid" ]; then
   exit 0
fi

state_f="/var/lib/test_monitoring"
pid_f="$s_path/pid"
mkdir "$s_path"

if [ ! -f "$pid_f" ]; then
   echo "$pid" > "$pid_f"
fi

s_pid=$(cat "$pid_f")

if [ "$pid" != "$s_pid" ]; then
   echo "$(date '+%Y-%m-%d %H:%M:%S') - Перезапущен процесс $p_name."  >> "$log_f"
   echo "$pid" > "$state_f"
fi

http_code=$(curl -w "%{http_code}" -s -o /dev/null --max-time 25 "$url" 2>&1)
exit_code=$?

if [ $exit_code -ne 0 ]; then
   echo "$(date '+%Y-%m-%d %H:%M:%S') -  $url не доступен." >> "$log_f"
elif [ "$http_code" -ge 400 ] || [ "$http_code" -eq 000 ]; then
   echo "$(date '+%Y-%m-%d %H:%M:%S') - Сервер вернул ошибку. Код ответа: $http_code." >> "$log_f"
fi
