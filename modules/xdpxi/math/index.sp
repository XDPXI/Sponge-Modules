let PI = 3.141592653589793
let E = 2.718281828459045
let TAU = 6.283185307179586
let GOLDEN_RATIO = 1.618033988749895
let SQRT2 = 1.4142135623730951
let SQRT3 = 1.7320508075688772

def add(a, b) {
    return a + b
}

def subtract(a, b) {
    return a - b
}

def multiply(a, b) {
    return a * b
}

def divide(a, b) {
    if b == 0 {
        print("Error: Division by zero")
        return null
    }
    return a / b
}

def modulo(a, b) {
    return a % b
}

def sin(x) {
    let tau = 6.283185307179586
    let x_mod = x % tau
    let result = x_mod
    let term = x_mod
    let i = 1
    while i < 10 {
        term = term * (-1) * x_mod * x_mod / ((2 * i) * (2 * i + 1))
        result = result + term
        i = i + 1
    }
    return result
}

def cos(x) {
    let tau = 6.283185307179586
    let x_mod = x % tau
    let result = 1.0
    let term = 1.0
    let i = 1
    while i < 10 {
        term = term * (-1) * x_mod * x_mod / ((2 * i - 1) * (2 * i))
        result = result + term
        i = i + 1
    }
    return result
}

def tan(x) {
    let c = cos(x)
    if abs(c) < 0.0001 {
        print("Error: tan undefined at this point")
        return null
    }
    return sin(x) / c
}

def asin(x) {
    if x < -1 or x > 1 {
        print("Error: asin domain is [-1, 1]")
        return null
    }
    return x + (x ** 3) / 6 + (3 * x ** 5) / 40
}

def acos(x) {
    let pi = 3.141592653589793
    return (pi / 2) - asin(x)
}

def atan(x) {
    return x - (x ** 3) / 3 + (x ** 5) / 5 - (x ** 7) / 7
}

def atan2(y, x) {
    let pi = 3.141592653589793
    if x > 0 {
        return atan(y / x)
    }
    if x < 0 and y >= 0 {
        return atan(y / x) + pi
    }
    if x < 0 and y < 0 {
        return atan(y / x) - pi
    }
    if x == 0 and y > 0 {
        return pi / 2
    }
    if x == 0 and y < 0 {
        return -pi / 2
    }
    return 0
}

def sinh(x) {
    let ex = exp(x)
    let e_x = exp(-x)
    return (ex - e_x) / 2
}

def cosh(x) {
    let ex = exp(x)
    let e_x = exp(-x)
    return (ex + e_x) / 2
}

def tanh(x) {
    let ex = exp(x)
    let e_x = exp(-x)
    return (ex - e_x) / (ex + e_x)
}

def exp(x) {
    let result = 1.0
    let term = 1.0
    let i = 1
    while i < 20 {
        term = term * x / i
        result = result + term
        i = i + 1
    }
    return result
}

def ln(x) {
    if x <= 0 {
        print("Error: ln domain is (0, infinity)")
        return null
    }
    let y = (x - 1) / (x + 1)
    let y2 = y * y
    let result = 0.0
    let term = y
    let i = 1
    while i < 20 {
        result = result + term / i
        term = term * y2
        i = i + 2
    }
    return 2 * result
}

def log10(x) {
    return ln(x) / ln(10)
}

def log2(x) {
    return ln(x) / ln(2)
}

def log(x, base) {
    return ln(x) / ln(base)
}

def power(base, exponent) {
    return base ** exponent
}

def square(x) {
    return x * x
}

def cube(x) {
    return x * x * x
}

def sqrt_custom(x) {
    if x < 0 {
        print("Error: Cannot calculate square root of negative number")
        return null
    }
    if x == 0 {
        return 0
    }
    let guess = x / 2
    let i = 0
    while i < 10 {
        guess = (guess + x / guess) / 2
        i = i + 1
    }
    return guess
}

def cbrt(x) {
    let sign = 1
    if x < 0 {
        sign = -1
        x = -x
    }
    let guess = x / 3
    let i = 0
    while i < 10 {
        guess = (2 * guess + x / (guess * guess)) / 3
        i = i + 1
    }
    return sign * guess
}

def nth_root(x, n) {
    if n == 0 {
        print("Error: Cannot calculate 0th root")
        return null
    }
    if n == 2 {
        return sqrt_custom(x)
    }
    let guess = x / n
    let i = 0
    while i < 15 {
        guess = ((n - 1) * guess + x / (guess ** (n - 1))) / n
        i = i + 1
    }
    return guess
}

def clamp(value, min_val, max_val) {
    if value < min_val {
        return min_val
    }
    if value > max_val {
        return max_val
    }
    return value
}

def lerp(a, b, t) {
    return a + (b - a) * t
}

def sign(x) {
    if x > 0 {
        return 1
    }
    if x < 0 {
        return -1
    }
    return 0
}

def fract(x) {
    return x - floor(x)
}

def factorial(n) {
    if n < 0 {
        print("Error: Factorial undefined for negative numbers")
        return null
    }
    if n == 0 or n == 1 {
        return 1
    }
    let result = 1
    let i = 2
    while i <= n {
        result = result * i
        i = i + 1
    }
    return result
}

def combination(n, k) {
    if k > n {
        return 0
    }
    if k == 0 or k == n {
        return 1
    }
    return factorial(n) / (factorial(k) * factorial(n - k))
}

def permutation(n, k) {
    if k > n {
        return 0
    }
    return factorial(n) / factorial(n - k)
}

def mean(arr) {
    if len(arr) == 0 {
        return null
    }
    let sum = 0
    for val in arr {
        sum = sum + val
    }
    return sum / len(arr)
}

def median(arr) {
    if len(arr) == 0 {
        return null
    }
    let sorted = arr
    let n = len(sorted)
    if n % 2 == 1 {
        return sorted[n / 2]
    }
    return (sorted[n / 2 - 1] + sorted[n / 2]) / 2
}

def variance(arr) {
    if len(arr) == 0 {
        return null
    }
    let m = mean(arr)
    let sum_sq = 0
    for val in arr {
        let diff = val - m
        sum_sq = sum_sq + diff * diff
    }
    return sum_sq / len(arr)
}

def std_dev(arr) {
    let var = variance(arr)
    if var == null {
        return null
    }
    return sqrt(var)
}

def sum_array(arr) {
    let total = 0
    for val in arr {
        total = total + val
    }
    return total
}

def product_array(arr) {
    let total = 1
    for val in arr {
        total = total * val
    }
    return total
}

def gcd(a, b) {
    a = abs(a)
    b = abs(b)
    while b != 0 {
        let temp = b
        b = a % b
        a = temp
    }
    return a
}

def lcm(a, b) {
    return abs(a * b) / gcd(a, b)
}

def is_prime(n) {
    if n < 2 {
        return false
    }
    if n == 2 {
        return true
    }
    if n % 2 == 0 {
        return false
    }
    let i = 3
    while i * i <= n {
        if n % i == 0 {
            return false
        }
        i = i + 2
    }
    return true
}

def is_even(n) {
    return n % 2 == 0
}

def is_odd(n) {
    return n % 2 != 0
}

def deg_to_rad(degrees) {
    let pi = 3.141592653589793
    return degrees * pi / 180
}

def rad_to_deg(radians) {
    let pi = 3.141592653589793
    return radians * 180 / pi
}

def distance_2d(x1, y1, x2, y2) {
    let dx = x2 - x1
    let dy = y2 - y1
    return sqrt(dx * dx + dy * dy)
}

def distance_3d(x1, y1, z1, x2, y2, z2) {
    let dx = x2 - x1
    let dy = y2 - y1
    let dz = z2 - z1
    return sqrt(dx * dx + dy * dy + dz * dz)
}

def manhattan_distance(x1, y1, x2, y2) {
    return abs(x2 - x1) + abs(y2 - y1)
}

def dot_product(v1, v2) {
    if len(v1) != len(v2) {
        print("Error: Vectors must have same length")
        return null
    }
    let result = 0
    let i = 0
    while i < len(v1) {
        result = result + v1[i] * v2[i]
        i = i + 1
    }
    return result
}

def magnitude(v) {
    let sum_sq = 0
    for component in v {
        sum_sq = sum_sq + component * component
    }
    return sqrt(sum_sq)
}

def normalize(v) {
    let mag = magnitude(v)
    if mag == 0 {
        return v
    }
    let result = []
    for component in v {
        result = push(result, component / mag)
    }
    return result
}

def map_range(value, in_min, in_max, out_min, out_max) {
    return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
}

def constrain(value, low, high) {
    return clamp(value, low, high)
}

def fibonacci(n) {
    if n <= 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    let a = 0
    let b = 1
    let i = 2
    while i <= n {
        let temp = a + b
        a = b
        b = temp
        i = i + 1
    }
    return b
}
