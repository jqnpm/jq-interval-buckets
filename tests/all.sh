#!/usr/bin/env bash


fileUnderTest="${BASH_SOURCE%/*}/../jq/main.jq"


read -d '' fourLineTests <<-'EOF' || true
toIntervalBucketIndex: Can't use empty input array. (Throws error.)
[]
toIntervalBucketIndex(1)


toIntervalBucketIndex: Can map 0 to 0.
[ 7, 8, 9 ]
toIntervalBucketIndex(0)
0

toIntervalBucketIndex: Can map -1 to 0.
[ 7, 8, 9 ]
toIntervalBucketIndex(-1)
0

toIntervalBucketIndex: Can map 1 to 1.
[ 7, 8, 9 ]
toIntervalBucketIndex(1)
1

toIntervalBucketIndex: Can map 2 to 2.
[ 7, 8, 9 ]
toIntervalBucketIndex(2)
2

toIntervalBucketIndex: Can map 3 to 2.
[ 7, 8, 9 ]
toIntervalBucketIndex(3)
2

create: Can create three buckets.
null
create(3)
[ 0, 0, 0 ]

increment/1: Can increment inside interval.
3
create(.) | increment(0)
[ 1, 0, 0 ]

increment/1: Can increment inside interval.
3
create(.) | increment(1)
[ 0, 1, 0 ]

increment/1: Can increment inside interval.
3
create(.) | increment(2)
[ 0, 0, 1 ]

increment/1: Can increment below interval.
3
create(.) | increment(-1)
[ 1, 0, 0 ]

increment/1: Can increment below interval.
3
create(.) | increment(-99999999)
[ 1, 0, 0 ]

increment/1: Can increment above interval.
3
create(.) | increment(length)
[ 0, 0, 1 ]

increment/1: Can increment above interval.
3
create(.) | increment(999999)
[ 0, 0, 1 ]

increment/2: Can increment inside interval by 9.
3
create(.) | increment(0; 9)
[ 9, 0, 0 ]

increment/2: Can increment inside interval by 9.
3
create(.) | increment(1; 9)
[ 0, 9, 0 ]

increment/2: Can increment inside interval by 9.
3
create(.) | increment(2; 9)
[ 0, 0, 9 ]

increment/2: Can increment below interval by 9.
3
create(.) | increment(-1; 9)
[ 9, 0, 0 ]

increment/2: Can increment below interval by 9.
3
create(.) | increment(-99999999; 9)
[ 9, 0, 0 ]

increment/2: Can increment above interval by 9.
3
create(.) | increment(length; 9)
[ 0, 0, 9 ]

increment/2: Can increment above interval by 9.
3
create(.) | increment(999999; 9)
[ 0, 0, 9 ]
EOF

function testAllFourLineTests () {
	echo "$fourLineTests" | runAllFourLineTests
}


# Run tests above automatically.
# Custom tests can be added by adding new function with a name that starts with "test": function testSomething () { some test code; }
source "${BASH_SOURCE%/*}/test-runner.sh"
