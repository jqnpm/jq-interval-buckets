import "joelpurra/jq-counter-buckets" as CounterBucket;


def toIntervalBucketIndex($index):
	if length == 0 then
		error("Can't use 0 counter buckets as input.")
	elif $index <= 0 then
		0
	elif $index <= (length - 1) then
		$index
	else
		length - 1
	end;

# TODO: use an offset, so the first bucket (0) can be used properly?
def create($n):
	CounterBucket::create($n);

def increment($index; $count):
	toIntervalBucketIndex($index) as $intervalIndex
	| CounterBucket::increment($intervalIndex; $count);

def increment($index):
	increment($index; 1);
