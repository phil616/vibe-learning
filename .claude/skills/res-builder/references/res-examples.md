# RES 文件格式示例

## 示例 A：单文件 `Python学习.res.md`（节选）

```markdown
---
subject: Python 语言学习
type: res
created: 2025-03-18
updated: 2025-03-18
sources:
  - 《Python编程：从入门到实践》第3版（Eric Matthes）
  - https://docs.python.org/3/tutorial/
  - 用户补充笔记
---

# Python 语言学习·资源库

> 本文件由 res-builder 自动整理，供 rdp-builder 生成学习路线图使用。

---

## 1. Python 语言介绍

> 来源：《Python编程：从入门到实践》第1章 + https://www.python.org/about/

Python 由 Guido van Rossum 于 1991 年首次发布，以"优雅、明确、简单"为核心设计哲学，
集中体现在《Python 之禅》（The Zen of Python，`import this`）中。

**版本现状**
- Python 2：已于 2020 年 1 月 1 日停止官方支持，生产环境不应再使用
- Python 3：当前主流，本资源库全部基于 Python 3.10+

**典型应用场景**
- 数据科学与机器学习（NumPy、Pandas、PyTorch）
- Web 后端开发（Django、FastAPI）
- 自动化脚本与运维工具
- 科学计算与教学

**不适合的场景**[补充]
- 对实时性要求极高的系统（受 GIL 限制）
- 移动端原生开发（无主流支持）
- 超低内存嵌入式系统

### 核心要点
- Python 是解释型、动态类型、面向对象的高级语言
- CPython 是官方实现，GIL 使其多线程受限于 I/O 密集场景
- PyPy、Jython、MicroPython 是面向不同场景的替代实现

### 关键术语
| 术语 | 解释 |
|------|------|
| 解释型语言 | 代码在运行时由解释器逐行翻译执行，无需预编译为机器码 |
| GIL | Global Interpreter Lock，CPython 的全局锁，同一时刻只有一个线程执行 Python 字节码 |
| CPython | Python 的 C 语言官方实现，也是最广泛使用的实现 |
| 动态类型 | 变量类型在运行时确定，无需在代码中显式声明 |

---

## 2. 基础数据类型

> 来源：《Python编程：从入门到实践》第2章，https://docs.python.org/3/library/stdtypes.html

### 数值类型

```python
# int：任意精度整数
x = 42
big = 10 ** 100  # Python int 无溢出

# float：64位双精度浮点
pi = 3.14159
# 注意精度问题：
print(0.1 + 0.2)  # 0.30000000000000004

# complex
c = 3 + 4j
print(c.real, c.imag)  # 3.0  4.0
```

### 字符串

```python
# 字符串不可变（immutable）
s = "hello"
# s[0] = 'H'  # TypeError！

# 常用操作
print(s.upper())          # HELLO
print(s[1:4])             # ell（切片）
print(f"Value: {42:.2f}") # f-string，Python 3.6+

# 多行字符串
text = """
第一行
第二行
"""
```

### 核心要点
- `int` 无大小限制，`float` 有精度问题，金融计算用 `decimal.Decimal`
- 字符串不可变，每次"修改"实际上创建新对象
- f-string 是最推荐的字符串格式化方式（Python 3.6+）

### 关键术语
| 术语 | 解释 |
|------|------|
| 不可变（immutable） | 对象创建后其值不能改变，str、int、tuple 均为不可变类型 |
| 切片（slice） | `s[start:stop:step]` 语法，返回子序列，不修改原对象 |
```

---

## 示例 B：目录结构 `Python学习.res/` 的 `index.md`

```markdown
---
subject: Python 语言学习
type: res-index
created: 2025-03-18
updated: 2025-03-18
sources:
  - 《Python编程：从入门到实践》第3版
  - 《流畅的Python》第2版
  - https://docs.python.org/3/
---

# Python 语言学习·资源目录

| 文件 | 覆盖内容 | 主要来源 | 预计行数 |
|------|---------|---------|---------|
| [01-语言介绍.md](./01-语言介绍.md) | 历史、设计哲学、GIL、适用场景 | 《Python编程》第1章 | ~120 |
| [02-环境配置.md](./02-环境配置.md) | pyenv、venv、pip、poetry | 官方文档 | ~150 |
| [03-基础语法.md](./03-基础语法.md) | 数据类型、控制流、推导式 | 《Python编程》第2-5章 | ~300 |
| [04-函数.md](./04-函数.md) | def、lambda、闭包、装饰器、LEGB | 《流畅的Python》第7-9章 | ~250 |
| [05-面向对象.md](./05-面向对象.md) | class、继承、MRO、魔术方法 | 《流畅的Python》第12-14章 | ~280 |
| [06-错误与模块.md](./06-错误与模块.md) | try/except、自定义异常、import | 官方文档 | ~180 |
| [07-进阶特性.md](./07-进阶特性.md) | 生成器、类型提示、asyncio | 《流畅的Python》第17-20章 | ~320 |
```

---

## 示例 C：目录中的章节文件 `03-基础语法.md`（头部）

```markdown
---
subject: Python 语言学习
chapter: 03-基础语法
type: res-chapter
created: 2025-03-18
---

# 基础语法

> 来源：《Python编程：从入门到实践》第2-5章（页码 45-190）

[后续内容与单文件格式中的知识块相同]
```
