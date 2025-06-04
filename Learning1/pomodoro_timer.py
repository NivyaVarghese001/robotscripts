import time
import os
import platform
import sys

def notify(title, message):
    """Cross-platform desktop notification."""
    system = platform.system()
    if system == "Linux":
        os.system(f'notify-send "{title}" "{message}"')
    elif system == "Darwin":  # macOS
        os.system(f'''
            osascript -e 'display notification "{message}" with title "{title}"'
        ''')
    elif system == "Windows":
        try:
            from plyer import notification
            notification.notify(title=title, message=message, timeout=10)
        except ImportError:
            print("❗ plyer not installed. Install it with: pip install plyer")

def pause_and_recheck(pause_interval=10 * 60):
    """Pause the timer and recheck after intervals."""
    notify("Pomodoro Timer", "Timer paused. Will check back in 5 minutes.")
    while True:
        print(f"\n⏸️ Timer paused. Waiting {pause_interval // 60} minutes...")
        time.sleep(pause_interval)

        print("\n⏰ Do you want to resume the timer?")
        choice = input("Enter 'y' to resume, or 'n' to stay paused: ").strip().lower()

        if choice == 'y':
            notify("Pomodoro Timer", "Resuming Pomodoro Timer.")
            return True
        elif choice == 'n':
            notify("Pomodoro Timer", "Still paused. Will recheck again in 5 minutes.")
        else:
            print("❗ Invalid input. Enter 'y' or 'n'.")

def pomodoro_timer():
    session_duration = 25 * 60  # 25 minutes

    while True:
        print("\n⏳ Session started: {} minutes.".format(session_duration // 60))
        notify("Pomodoro Timer", f"{session_duration // 60}-minute session started!")
        time.sleep(session_duration)

        # After session ends
        while True:
            print("\n🔔 Time's up! What would you like to do next?")
            print("1. Take a 5-minute break")
            print("2. Start a new 25-minute work session")
            print("3. Pause the timer")
            print("4. Exit timer")
            choice = input("Enter 1, 2, 3, or 4: ").strip()

            if choice == "1":
                session_duration = 5 * 60
                notify("Pomodoro Timer", "Starting 5-minute break!")
                break
            elif choice == "2":
                session_duration = 25 * 60
                notify("Pomodoro Timer", "Starting 25-minute work session!")
                break
            elif choice == "3":
                if pause_and_recheck():
                    # After resume, continue with last session duration
                    notify("Pomodoro Timer", f"Resuming {session_duration // 60}-minute session.")
                    break
            elif choice == "4":
                notify("Pomodoro Timer", "Pomodoro timer stopped. See you soon!")
                print("👋 Exiting Pomodoro Timer. Stay productive!")
                sys.exit(0)
            else:
                print("❗ Invalid input. Please enter 1, 2, 3, or 4.")

if __name__ == "__main__":
    pomodoro_timer()
