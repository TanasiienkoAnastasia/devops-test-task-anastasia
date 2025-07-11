#!/bin/bash

# Функція друку привітання
print_greeting() {
    echo "Hello from Bash!"
}

# Функція друку дати
print_date() {
    date
}

# Функція підрахунку кількості файлів у output/
count_files() {
    find output/ -maxdepth 1 -type f | wc -l
}

# Основний скрипт
main() {
    greeting=$(print_greeting)
    datetime=$(print_date)
    file_count=$(count_files)

    timestamp=$(date "+%Y%m%d_%H%M%S")

    if [ -z "$1" ]; then
        logfile="logs/log-$timestamp.txt"
    else
        logfile="logs/$1.txt"
    fi

    {
        echo "$greeting"
        echo "$datetime"
        echo "File count in output/: $file_count"
    } > "$logfile"

    # Запис в history.txt
    echo "$(date) - $logfile" >> logs/history.txt

    echo "Log saved to $logfile"
}

main "$@"

