from pathlib import Path
import subprocess

root = Path(__file__).resolve().parents[1]
cases = {
    'hello': (0, 'Hello, world!\n'),
    'exit2': (2, ''),
    'uppercase': (0, 'Hello, World! 123\nHELLO, WORLD! 123\n'),
    'heap': (0, 'HEAP OK\n'),
    'fibonacci': (0, '0 1 1 2 3 5 8 13 21 34\n'),
}
for program, (status, expected) in cases.items():
    result = subprocess.run([str(root / 'build' / program)], capture_output=True, text=True, timeout=5)
    assert result.returncode == status, (program, result.returncode, result.stderr)
    assert result.stdout == expected, (program, result.stdout)
    print(f'PASS {program}')
