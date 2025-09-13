#!/bin/bash

# background_process_scanner.sh
# Lists background processes, flags unknown ones

# Known system/background processes to ignore
KNOWN_SYSTEM_PROCESSES=(
  "init"
  "systemd"
  "kthreadd"
  "kworker"
  "rcu_sched"
  "rcu_bh"
  "migration"
  "watchdog"
  "kswapd"
  "bioset"
  "irq"
  "sshd"
  "dbus-daemon"
  "NetworkManager"
  "polkitd"
  "Xorg"
  "bash"
  "login"
  "getty"
  "cron"
  "gnome-shell"
  "lightdm"
  "gdm"
  "systemd-udevd"
  "systemd-journald"
  "systemd-logind"
  "cupsd"
  "udisksd"
  "at-spi-bus-launcher"
  "upowerd"
  "tracker-miner"
  "gvfsd"
  "pulseaudio"
  "bluetoothd"
  "dbus-launch"
)

echo ""
echo "🛡️  Scanning for background processes..."
echo "---------------------------------------------"
echo ""

ps -eo pid,ppid,tty,stat,comm --no-headers | while read -r pid ppid tty stat comm; do
  # Only consider processes with "?" as TTY — i.e., background processes
  if [[ "$tty" == "?" ]]; then
    is_known=false
    for known in "${KNOWN_SYSTEM_PROCESSES[@]}"; do
      if [[ "$comm" == "$known" ]]; then
        is_known=true
        break
      fi
    done

    if [[ "$is_known" == false ]]; then
      echo "⚠️  [PID: $pid | PPID: $ppid] Suspicious Background Process → $comm"
    else
      echo "✅ [PID: $pid] Trusted system process: $comm"
    fi
  fi
done

echo ""
echo "✅ Done scanning background processes."
echo "🔍 Review any ⚠️ entries for possible suspicious activity."
