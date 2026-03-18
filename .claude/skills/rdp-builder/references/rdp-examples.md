# RDP 文件格式完整示例

## 完整示例：`Python学习.rdp.md`

以下是对应 `Python学习.res/` 目录（7个章节文件）生成的完整 rdp 文件。
注意：CONTENT 字段只有链接和主题摘要，**无任何知识正文**。

---

```markdown
---
subject: Python 语言学习
type: rdp
created: 2025-03-18
updated: 2025-03-18
res: Python学习.res/
progress: 0/7
---

# Python 语言学习·路线图

> 创建时间：2025-03-18 | 整体进度：0/7 节点
> 资源文件：[Python学习.res/](./Python学习.res/)（查看 [目录总览](./Python学习.res/index.md)）

---

## 1. Python 语言介绍

### 1.0 PREREQUISITES
无

### 1.1 CONTENT
> 原始内容：[01-语言介绍.md](./Python学习.res/01-语言介绍.md)
>
> 核心主题：Python 历史与设计哲学、CPython 与 GIL、解释型语言原理、适用与不适用场景

### 1.2 COVERAGE
- [ ] 能用自己的话解释解释型语言与编译型语言的本质区别
- [ ] 能说出 Python 2 与 Python 3 最重要的两个不兼容差异
- [ ] 能解释 GIL 的存在原因及其对多线程的实际影响
- [ ] 能描述 Python 适合和不适合哪些典型应用场景

### 1.3 STATUS
- ❌ 尚未开始学习本节点

### 1.4 LOGS
（暂无记录）

---

## 2. 环境配置与工具链

### 2.0 PREREQUISITES
- 依赖：1. Python 语言介绍（建议完成）

### 2.1 CONTENT
> 原始内容：[02-环境配置.md](./Python学习.res/02-环境配置.md)
>
> 核心主题：pyenv 版本管理、venv 虚拟环境、pip 包管理、poetry/uv 现代工具链

### 2.2 COVERAGE
- [ ] 能解释虚拟环境解决了什么问题，并举出不使用会导致的具体后果
- [ ] 能独立创建并激活 venv 虚拟环境
- [ ] 能使用 pip 安装包、导出并从 requirements.txt 恢复环境
- [ ] 能区分 pyenv、venv、pip 三者各自解决的问题层次
- [ ] 能在命令行确认当前使用的 Python 解释器路径

### 2.3 STATUS
- ❌ 尚未开始学习本节点

### 2.4 LOGS
（暂无记录）

---

## 3. 基础语法与数据类型

### 3.0 PREREQUISITES
- 依赖：2. 环境配置与工具链（STATUS 需全部 ✅）

### 3.1 CONTENT
> 原始内容：[03-基础语法.md](./Python学习.res/03-基础语法.md)
>
> 核心主题：int/float/str/bool/None、list/tuple/dict/set、控制流、列表推导式、鸭子类型

### 3.2 COVERAGE
- [ ] 能区分 list、tuple、dict、set 的使用场景，并说出每种的一个独特特性
- [ ] 能解释字符串不可变性的内存含义
- [ ] 能写出包含条件过滤的列表推导式
- [ ] 能解释 `is` 和 `==` 的区别，并举出 `is` 返回 True 而 `==` 返回 False 的例子
- [ ] 能说出 Python 中可变对象与不可变对象各两例，并解释区别
- [ ] 不查资料能写出同时遍历字典 key 和 value 的代码

### 3.3 STATUS
- ❌ 尚未开始学习本节点

### 3.4 LOGS
（暂无记录）

---

## 4. 函数与作用域

### 4.0 PREREQUISITES
- 依赖：3. 基础语法与数据类型（STATUS 需全部 ✅）

### 4.1 CONTENT
> 原始内容：[04-函数.md](./Python学习.res/04-函数.md)
>
> 核心主题：def/lambda、*args/**kwargs、LEGB 作用域规则、闭包、装饰器、可变默认参数陷阱

### 4.2 COVERAGE
- [ ] 能解释 LEGB 规则的查找顺序，并演示 `global` 关键字的使用场景
- [ ] 能正确区分并使用 `*args` 和 `**kwargs`
- [ ] 能不借助 `functools` 手写一个记录调用次数的装饰器
- [ ] 能解释闭包的定义并举出一个实际使用场景
- [ ] 能解释可变对象作为默认参数的陷阱及正确修复方式

### 4.3 STATUS
- ❌ 尚未开始学习本节点

### 4.4 LOGS
（暂无记录）

---

## 5. 面向对象编程

### 5.0 PREREQUISITES
- 依赖：4. 函数与作用域（STATUS 需全部 ✅）

### 5.1 CONTENT
> 原始内容：[05-面向对象.md](./Python学习.res/05-面向对象.md)
>
> 核心主题：class/self/__init__、实例属性 vs 类属性、继承与 MRO、魔术方法、上下文管理器、@dataclass

### 5.2 COVERAGE
- [ ] 能解释 `self` 为什么需要显式传入，Python 和其他语言的区别
- [ ] 能构造一个类属性 vs 实例属性混淆导致 bug 的代码示例
- [ ] 能用自己的话描述 MRO（C3 线性化）解决了多继承的什么问题
- [ ] 能手写一个支持 `with` 语句的上下文管理器类（实现 __enter__ 和 __exit__）
- [ ] 能说出至少 4 个魔术方法及其触发时机

### 5.3 STATUS
- ❌ 尚未开始学习本节点

### 5.4 LOGS
（暂无记录）

---

## 6. 错误处理与模块系统

### 6.0 PREREQUISITES
- 依赖：5. 面向对象编程（STATUS 需全部 ✅）

### 6.1 CONTENT
> 原始内容：[06-错误与模块.md](./Python学习.res/06-错误与模块.md)
>
> 核心主题：try/except/else/finally 完整结构、异常继承体系、自定义异常、import 查找路径、标准库常用模块

### 6.2 COVERAGE
- [ ] 能解释 `else` 在 try/except/else 中的精确触发条件（区别于 finally）
- [ ] 能解释 `finally` 的保证，包括 return 语句存在时的行为
- [ ] 能设计一个两层继承的自定义异常类体系
- [ ] 能解释 `if __name__ == "__main__"` 的作用及缺少它时会发生什么
- [ ] 能用 `pathlib.Path` 而非字符串拼接处理跨平台文件路径

### 6.3 STATUS
- ❌ 尚未开始学习本节点

### 6.4 LOGS
（暂无记录）

---

## 7. Python 进阶特性

### 7.0 PREREQUISITES
- 依赖：6. 错误处理与模块系统（STATUS 需全部 ✅）

### 7.1 CONTENT
> 原始内容：[07-进阶特性.md](./Python学习.res/07-进阶特性.md)
>
> 核心主题：生成器与迭代器协议、类型提示与 mypy、threading/multiprocessing/asyncio 三种并发模型

### 7.2 COVERAGE
- [ ] 能解释生成器与列表在内存占用上的差异，举出适合生成器的场景
- [ ] 能手写一个用 `yield` 实现的无限序列生成器
- [ ] 能解释 threading、multiprocessing、asyncio 分别适合哪类任务及原因
- [ ] 能用 `async/await` 写出并发请求多个 URL 的基本结构
- [ ] 能解释类型提示对 Python 运行时是否有影响，并说明其真正作用

### 7.3 STATUS
- ❌ 尚未开始学习本节点

### 7.4 LOGS
（暂无记录）
```

---

## 对应的文件体积对比

| 文件 | 行数 | 作用 |
|------|------|------|
| `Python学习.res/`（7个文件合计） | ~1600 行 | 原始知识内容，学习时查阅 |
| `Python学习.rdp.md` | ~140 行 | 路线图索引，AI 每次对话读取 |

**rdp 是 res 体积的 ~8%**，OpenCode 读取 rdp 时几乎不消耗 context，
需要深入某个节点时再按需读取对应的 res 章节文件。

---

## 学习进行中的 STATUS 更新示例

以下是节点 3 在学习过程中 STATUS 和 LOGS 的更新示范（供参考，非生成时填写）：

```markdown
### 3.3 STATUS
- ✅ 能区分 list/tuple/dict/set 的使用场景
- ✅ 理解字符串不可变性
- 🔄 列表推导式会写，但带条件过滤时不够熟练
- ❌ `is` 和 `==` 的区别仍然混淆
- ❌ 可变与不可变对象的分类不清晰

### 3.4 LOGS
- 2025-03-20 初次学习，阅读 03-基础语法.md，完成基础部分
- 2025-03-21 费曼测试：list/tuple/dict/set 通过；推导式需加练习；更新 STATUS
```
