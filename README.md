# Example: Trigger process on the first business day of the month

The purpose of this robot:

- Check if today is the first business day of the current month.
- If it is the first business day the robot triggers a Control Room process that needs to run on the first business day of every month.

Robot could be scheduled to run for example every months first, second and the third day with the following cron expression: `0 7 1,2,3 * *`.
