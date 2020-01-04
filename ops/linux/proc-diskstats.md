# /proc/diskstats

https://www.kernel.org/doc/Documentation/ABI/testing/procfs-diskstats

```text
What:		/proc/diskstats
Date:		February 2008
Contact:	Jerome Marchand <jmarchan@redhat.com>
Description:
		The /proc/diskstats file displays the I/O statistics
		of block devices. Each line contains the following 14
		fields:

		 1 - major number
		 2 - minor mumber
		 3 - device name
		 4 - reads completed successfully
		 5 - reads merged
		 6 - sectors read
		 7 - time spent reading (ms)
		 8 - writes completed
		 9 - writes merged
		10 - sectors written
		11 - time spent writing (ms)
		12 - I/Os currently in progress
		13 - time spent doing I/Os (ms)
		14 - weighted time spent doing I/Os (ms)

		Kernel 4.18+ appends four more fields for discard
		tracking putting the total at 18:

		15 - discards completed successfully
		16 - discards merged
		17 - sectors discarded
		18 - time spent discarding

		Kernel 5.5+ appends two more fields for flush requests:

		19 - flush requests completed successfully
		20 - time spent flushing

		For more details refer to Documentation/admin-guide/iostats.rst

```

```sh
# for coreos
cat /proc/diskstats | awk 'BEGIN {printf("%s %s %4s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s\n" ,"major", "minor", "device", "reads/comp", "reads/merged", "sectors read", "spent(ms)", "writes/comp", "writes/merged", "sectors written", "spent(ms)", "I/Os", "spent(ms)", "weighted(ms)", "discards/comp", 
"discards/merged", "sectors discarded", "spent")}
{printf("%s %s %4s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s\n", $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18)}'
```