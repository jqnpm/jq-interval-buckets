<p align="center">
  <a href="https://github.com/joelpurra/jqnpm"><img src="https://raw.githubusercontent.com/joelpurra/jqnpm/master/resources/logotype/penrose-triangle.svg?sanitize=true" alt="jqnpm logotype, a Penrose triangle" width="100" border="0" /></a>
</p>

# [jq-interval-buckets](https://github.com/joelpurra/jq-interval-buckets)

Counter buckets which also collect values outside an integer interval `0..n-1` in the first and last buckets respectively. Useful when a series of values has extreme values, and only a narrow interval is interesting. The first bucket `0` contains all values at `0` or below, the last bucket `n-1` contains all values at `n-1` or above.



> ## ⚠️ This project has been archived
>
> No future updates are planned. Feel free to continue using it, but expect no support.



This is a package for the command-line JSON processor [`jq`](https://stedolan.github.io/jq/). Install the package in your jq project/package directory with [`jqnpm`](https://github.com/joelpurra/jqnpm):

```bash
jqnpm install joelpurra/jq-interval-buckets
```



## Usage


```jq
import "joelpurra/jq-interval-buckets" as IntervalBuckets;

# Create 10 interval buckets.
IntervalBuckets::create(10)             # [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]

# Increment index 0, which is also the bucket for any value below 0.
| IntervalBuckets::increment(0)         # [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]

# Increment index 5.
| IntervalBuckets::increment(5)         # [ 1, 0, 0, 0, 0, 1, 0, 0, 0, 0 ]

# Increment index 9, which is also the bucket for any value above 9, by 999.
| IntervalBuckets::increment(9; 999)    # [ 1, 0, 0, 0, 0, 1, 0, 0, 0, 999 ]

# Increment index below range.
| IntervalBuckets::increment(-333)      # [ 2, 0, 0, 0, 0, 1, 0, 0, 0, 999 ]

# Increment index above range.
| IntervalBuckets::increment(666)       # [ 2, 0, 0, 0, 0, 1, 0, 0, 0, 1000 ]
```



---

## License
Copyright (c) 2015 Joel Purra <https://joelpurra.com/>
All rights reserved.

When using **jq-interval-buckets**, comply to the MIT license. Please see the LICENSE file for details.
