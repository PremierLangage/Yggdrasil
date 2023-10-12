from collections import defaultdict
import random
import sys
import time

N = 6

# assume all rules are A -> B C or A -> 'a'
def cyk(start, rules, word):
	P = defaultdict(set)
	rev_rules = defaultdict(set)
	for lhs, rhs in rules:
		rev_rules[rhs].add(lhs)
	for i,c in enumerate(word):
		P[i,i+1] = rev_rules[(c,)]
	for k in range(2,len(word)+1):
		for i in range(len(word)-k+1):
			for j in range(1,k):
				for B in P[i,i+j]:
					for C in P[i+j,i+k]:
						P[i,i+k] |= rev_rules[B,C]
	return start in P[0,len(word)]

def sample_rules(n):
	rules = {
		(0, ('a',)),
		(1, ('b',))
	}
	for i in range(n-1):
		a = random.randrange(2,min(i+3,n-1))
		if a >= i:
			a += 1
		b, c = i, random.randrange(i, min(i+3,n-1))
		if random.randrange(2) == 0:
			b, c = c, b
		rules.add((a, (b, c)))
	for i in range(2,n):
		m = max(0, i-3)
		for k in range(2):
			rules.add((i, (random.randrange(m, i),random.randrange(m, i))))

	return list(sorted(rules, reverse=True))

def sample_word(start, rules, max_size=20):
	rules_dict = defaultdict(set)
	for lhs,rhs in rules:
		rules_dict[lhs].add(rhs)
	for lhs in rules_dict:
		rules_dict[lhs] = list(sorted(rules_dict[lhs]))

	while True:
		word = [start]

		while any(rules_dict[c] for c in word):
			next_word = []
			for c in word:
				if rules_dict[c]:
					next_word += list(random.choice(list(rules_dict[c])))
				else:
					next_word.append(c)
			word = next_word

			if len(word) > max_size:
				break
		else:
			return ''.join(word)

def random_word(min_size, max_size):
	return ''.join(random.choice('ab') for _ in range(random.randrange(min_size, max_size+1)))

def format_rule(r, n):
	lhs, rhs = r
	lhs = chr(64+n-lhs)
	if len(rhs) == 1:
		rhs = repr(rhs[0])
	else:
		b,c = rhs
		rhs = chr(64+n-b) + ' ' + chr(64+n-c)
	return lhs + ' -> ' + rhs

def generate_input(seed, n):
	random.seed(a=seed)
	rules = sample_rules(n)

	good_words = set()
	for _ in range(1000):
		if len(good_words) >= 8:
			break
		word = sample_word(n-1, rules, max_size=10)
		if len(word) >= 8 and len(set(word)) == 2:
			good_words.add(word)
	else:
		return rules, [], []

	bad_words = set()

	for _ in range(1000):
		if len(bad_words) >= 8:
			break
		word = random_word(8,10)
		if not cyk(n-1,rules, word):
			bad_words.add(word)
	else:
		return rules, [], []

	return rules, list(good_words), list(bad_words)

def get_input(ident):
    seed = time.time()
    rules, good, bad = generate_input(seed, N)

    if not good and not bad:
        # print("bad grammar: seed=%r, ident=%r", (seed, ident), file=sys.stderr)
        content = "Oups, il y a eu un soucis, veuillez actualiser la page"
    else:
        content = '# Seed: ' + str(seed) + '\n'
        content += '# Grammar:\n'

        for r in rules:
            content += format_rule(r, N) + '\n'

        content += '\n# Inputs:\n'

        for w in sorted(good + bad):
            content += w + '\n'

    return content