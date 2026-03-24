# Python 语言学习

> 创建时间：2025-03-18 | 最后更新：2025-03-18 | 整体进度：0/7 节点

------

## 1. Python 语言介绍

### 1.0 PREREQUISITES

无

### 1.1 CONTENT

Python 是由 Guido van Rossum 于 1991 年发布的高级动态解释型语言，以"优雅、明确、简单"为设计哲学（Python之禅，The Zen of Python）。当前主流版本为 Python 3.x，Python 2 已于 2020 年停止维护。

Python 的核心特点：

- 动态类型（Dynamic Typing）：变量无需声明类型
- 解释执行：代码由解释器逐行运行，无需编译步骤
- GIL（Global Interpreter Lock）：CPython 实现中的全局锁，影响多线程性能
- 丰富的标准库：号称"自带电池"（batteries included）
- 广泛应用于数据科学、Web 开发、自动化脚本、AI/ML 领域

### 1.2 COVERAGE

- [ ] 能用自己的话解释"解释型语言"和"编译型语言"的核心区别
- [ ] 能说出 Python 2 和 Python 3 最重要的 2 个不兼容差异
- [ ] 能解释什么是 GIL 及其对并发的影响
- [ ] 理解 CPython、PyPy、Jython 等不同实现的存在意义
- [ ] 能描述 Python 适合和不适合哪些场景

### 1.3 STATUS

- ❌ 尚未开始学习本节点

### 1.4 LOGS

（暂无记录）

------

## 2. 环境配置与工具链

### 2.0 PREREQUISITES

- 依赖：1. Python 语言介绍（建议完成）

### 2.1 CONTENT

Python 的环境管理是初学者最容易踩坑的地方。核心概念：

**版本管理**

- `pyenv`：管理多个 Python 版本并在项目间切换

**虚拟环境（Virtual Environment）**

- `venv`：Python 内置，隔离项目依赖
- `conda`：数据科学场景常用，同时管理 Python 版本和依赖

**包管理**

- `pip`：官方包管理器，配合 `requirements.txt` 使用
- `poetry` / `uv`：现代项目依赖管理工具，支持 lock file

**开发工具**

- VSCode + Python 扩展 / PyCharm：主流 IDE
- Jupyter Notebook：数据分析/探索场景

### 2.2 COVERAGE

- [ ] 能解释为什么需要虚拟环境（能举出不用会发生什么后果的例子）
- [ ] 能独立创建并激活 venv 虚拟环境
- [ ] 能使用 pip 安装包、导出 requirements.txt、从 requirements.txt 恢复环境
- [ ] 理解 `pyenv`、`venv`、`pip` 三者分别解决什么问题
- [ ] 能在命令行确认当前使用的是哪个 Python 解释器（路径）

### 2.3 STATUS

- ❌ 尚未开始学习本节点

### 2.4 LOGS

（暂无记录）

------

## 3. 基础语法与数据类型

### 3.0 PREREQUISITES

- 依赖：2. 环境配置与工具链（STATUS 需全部完成）

### 3.1 CONTENT

**基本数据类型**

- `int`、`float`、`complex`：数值
- `str`：字符串，不可变，支持切片
- `bool`：True / False（注意是大写）
- `None`：空值，类似其他语言的 null

**容器类型**

- `list`：有序可变序列，`[1, 2, 3]`
- `tuple`：有序不可变序列，`(1, 2, 3)`
- `dict`：键值对，`{"key": "value"}`（Python 3.7+ 保持插入顺序）
- `set`：无序不重复集合，`{1, 2, 3}`

**控制流**

- `if / elif / else`
- `for ... in ...`（Python 的 for 本质是迭代器协议）
- `while`
- 列表推导式：`[x*2 for x in range(10) if x % 2 == 0]`

**重要特性**

- 缩进即语法（IndentationError 是常见错误）
- 鸭子类型（Duck Typing）
- 一切皆对象

### 3.2 COVERAGE

- [ ] 能区分 list、tuple、dict、set 的使用场景，并说出每种的一个独特特性
- [ ] 能解释字符串的不可变性意味着什么
- [ ] 能写出包含条件过滤的列表推导式
- [ ] 能解释 `is` 和 `==` 的区别
- [ ] 能说出 Python 中"可变对象"和"不可变对象"的区别，并各举两例
- [ ] 不查资料能写出一个字典的遍历（同时得到 key 和 value）

### 3.3 STATUS

- ❌ 尚未开始学习本节点

### 3.4 LOGS

（暂无记录）

------

## 4. 函数与作用域

### 4.0 PREREQUISITES

- 依赖：3. 基础语法与数据类型（STATUS 需全部完成）

### 4.1 CONTENT

**函数定义**

- `def`：普通函数
- `lambda`：匿名函数，适合简单单行逻辑
- 默认参数、关键字参数、`*args`、`**kwargs`

**作用域规则（LEGB）**

- Local → Enclosing → Global → Built-in
- `global` 和 `nonlocal` 关键字

**高阶函数**

- 函数是一等公民，可以作为参数传递、作为返回值
- `map()`、`filter()`、`sorted()` 的 key 参数

**装饰器（Decorator）**

- 本质是高阶函数，用 `@` 语法糖包裹函数
- 常见用途：日志、计时、权限校验、缓存（`@functools.lru_cache`）

**闭包（Closure）**

- 内层函数引用外层函数变量，外层函数返回内层函数

### 4.2 COVERAGE

- [ ] 能解释 LEGB 规则并演示 `global` 的使用场景
- [ ] 能区分 `*args` 和 `**kwargs`，并在函数中正确使用
- [ ] 能手写一个不借助 `functools` 的简单装饰器
- [ ] 能解释什么是闭包，并说出一个实际使用场景
- [ ] 理解默认参数为可变对象时的陷阱（经典 `def f(x=[]):` 问题）

### 4.3 STATUS

- ❌ 尚未开始学习本节点

### 4.4 LOGS

（暂无记录）

------

## 5. 面向对象编程（OOP）

### 5.0 PREREQUISITES

- 依赖：4. 函数与作用域（STATUS 需全部完成）

### 5.1 CONTENT

**类与对象**

- `class` 定义，`__init__` 构造方法
- `self` 的本质（显式传入的实例引用）
- 实例属性 vs 类属性

**继承与多态**

- 单继承、多继承（MRO，Method Resolution Order，C3 线性化）
- `super()` 的用法
- `isinstance()` 和 `issubclass()`

**魔术方法（Dunder Methods）**

- `__repr__`、`__str__`：对象的字符串表示
- `__len__`、`__getitem__`：让自定义类支持 `len()` 和下标访问
- `__eq__`、`__lt__`：支持比较操作符
- `__enter__`、`__exit__`：支持 `with` 语句（上下文管理器）

**数据类**

- `@dataclass`：Python 3.7+ 自动生成 `__init__`、`__repr__` 等

### 5.2 COVERAGE

- [ ] 能解释 `self` 为什么需要显式传入
- [ ] 能解释类属性和实例属性的区别，并构造一个会出 bug 的例子
- [ ] 能用自己的话描述 MRO 解决了什么问题
- [ ] 能手写一个支持 `with` 语句的上下文管理器类
- [ ] 能说出至少 4 个魔术方法及其触发时机

### 5.3 STATUS

- ❌ 尚未开始学习本节点

### 5.4 LOGS

（暂无记录）

------

## 6. 错误处理与模块系统

### 6.0 PREREQUISITES

- 依赖：5. 面向对象编程（STATUS 需全部完成）

### 6.1 CONTENT

**异常处理**

- `try / except / else / finally` 的完整结构
- 异常继承体系（`BaseException` → `Exception` → 具体异常）
- 自定义异常类
- `raise` 和 `raise ... from ...`

**模块与包**

- `import` 的查找路径（`sys.path`）
- `__name__ == "__main__"` 的含义
- 相对导入 vs 绝对导入
- `__init__.py` 的作用
- 常用标准库：`os`、`sys`、`pathlib`、`json`、`datetime`、`collections`、`itertools`

### 6.2 COVERAGE

- [ ] 能解释 `else` 在 `try/except/else` 中的具体触发条件
- [ ] 能解释 `finally` 的保证（即使有 return 也执行）
- [ ] 能设计一个自定义异常类层级（至少两层继承）
- [ ] 能解释 `if __name__ == "__main__"` 的作用
- [ ] 能用 `pathlib` 而非字符串拼接处理文件路径

### 6.3 STATUS

- ❌ 尚未开始学习本节点

### 6.4 LOGS

（暂无记录）

------

## 7. Python 进阶特性

### 7.0 PREREQUISITES

- 依赖：6. 错误处理与模块系统（STATUS 需全部完成）

### 7.1 CONTENT

**迭代器与生成器**

- 迭代器协议：`__iter__` + `__next__`
- `yield` 关键字：生成器函数
- `yield from`：委托生成器
- 生成器表达式：`(x for x in range(10))`

**类型提示（Type Hints）**

- `def f(x: int) -> str:`
- `Optional`、`Union`、`List`、`Dict`（Python 3.9+ 可用内置类型）
- `mypy` 静态类型检查

**并发模型**

- `threading`：受 GIL 限制，适合 I/O 密集型
- `multiprocessing`：绕过 GIL，适合 CPU 密集型
- `asyncio`：协程，适合高并发 I/O（`async/await` 语法）

**性能与调试**

- `cProfile` / `line_profiler`：性能分析
- `pdb` / `breakpoint()`：调试器
- `timeit`：小段代码计时

### 7.2 COVERAGE

- [ ] 能解释生成器和列表的内存占用差异，并举出适合用生成器的场景
- [ ] 能手写一个用 `yield` 实现的无限序列生成器
- [ ] 能解释 Python 三种并发模型各自适合哪种任务类型
- [ ] 能用 `async/await` 写一个并发请求多个 URL 的示例
- [ ] 能解释类型提示对运行时的影响（答案：没有影响）

### 7.3 STATUS

- ❌ 尚未开始学习本节点

### 7.4 LOGS

（暂无记录）