Run Sucessfullay

Compiling aiken-lang/get_first 0.0.0 (.)
    Resolving aiken-lang/get_first
      Fetched 1 package in 0.01s from cache
    Compiling aiken-lang/stdlib v2.1.0 (./build/packages/aiken-lang-stdlib)
    Compiling aiken-lang/fuzz v2 (./build/packages/aiken-lang-fuzz)
      Testing ...

    ┍━ get_first ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    │ PASS [mem:   4965, cpu:  1942210] quicksort_0
    │ PASS [mem:  95725, cpu: 25263001] quicksort_1
    │ PASS [mem: 106989, cpu: 27844470] quicksort_2
    │ PASS [after 100 tests] quicksort_prop
    │ · with coverage
    │ | non-empty  86.0%
    │ | empty      14.0%
    │ PASS [mem:   2433, cpu:  1508358] get_first_0
    │ PASS [mem:   3529, cpu:  1982416] get_first_1
    │ PASS [mem:   3529, cpu:  1982416] get_first_2
    ┕ with --seed=2309015512 → 7 tests | 7 passed | 0 failed

      Summary 106 checks, 0 errors, 0 warnings