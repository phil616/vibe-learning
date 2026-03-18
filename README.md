# Vibe Learning 氛围学习

> 利用 AI Agent 进行沉浸式技能学习的工具系统，通过智能体的 Agent 循环帮助你真正掌握特定领域的知识。

## 项目简介

Vibe Learning 是一个基于 AI Agent 的学习系统，它不只是给你答案，而是像一个专业的学习教练一样，通过苏格拉底式提问、费曼学习法等方法，引导你主动思考、真正掌握知识。

![image-20260318142600287](./README.assets/image-20260318142600287.png)

### 核心设计理念

- **内容与路线分离**：知识内容存放在 `.res` 文件中，学习路线和进度存放在 `.rdp` 文件中
- **AI 作为教练而非答案库**：引导思考，不直接给出答案
- **可验证的掌握标准**：每个知识点都有明确的 COVERAGE 检查清单
- **学习状态追踪**：完整记录学习过程和掌握情况

## 项目结构

```
vibe-learning/
├── .claude/
│   └── skills/
│       ├── res-builder/      # 资源整理技能
│       └── rdp-builder/      # 路线图生成技能
├── roadmaps/
│   └── AGENTS.md             # 学习教练 AI 行为规范
└── README.md
```

## 快速开始

### 1. 准备学习材料

收集你要学习的原始资料（网页、书籍章节、笔记等）。

### 2. 使用 res-builder 整理资源

说："帮我整理这份资料"或"生成 res 文件"，粘贴或上传学习材料。

### 3. 使用 rdp-builder 生成路线图

说："帮我生成路线图"或"根据这个 res 文件生成 rdp"。

### 4. 开始学习

AI 会自动定位当前学习节点，通过提问引导你学习。

## 文件格式规范

### .res.md 资源文件

```markdown
---
subject: Python 语言学习
type: res
created: 2025-03-18
sources:
  - 《Python编程：从入门到实践》
---

# Python 语言学习·资源库

## 1. 语言介绍

> 来源：《Python编程》第1章

[整理后的内容]

### 核心要点
- Python 是解释型语言
- 设计哲学：优雅、明确、简单

### 关键术语
| 术语 | 解释 |
|------|------|
| GIL | 全局解释器锁 |
```

### .rdp.md 路线图文件

```markdown
---
subject: Python 语言学习
type: rdp
created: 2025-03-18
res: Python学习.res.md
progress: 0/5
---

# Python 语言学习·路线图

## 1. 语言介绍

### 1.0 PREREQUISITES
无

### 1.1 CONTENT
> 原始内容见资源文件：
> [Python学习.res.md § 1. 语言介绍](./Python学习.res.md#1-语言介绍)
>
> 核心主题：Python历史、设计哲学、GIL

### 1.2 COVERAGE
- [ ] 能解释"解释型语言"与"编译型语言"的核心区别
- [ ] 能说出 Python 的设计哲学

### 1.3 STATUS
- ❌ 尚未开始学习本节点

### 1.4 LOGS
（暂无记录）
```

## 使用示例

### 整理学习资料

```
用户：我有一些关于 React 的学习笔记，帮我整理成 res 文件
AI：好的，请把笔记内容发给我，我会整理成规范的资源文件。
```

### 生成学习路线

```
用户：根据这个 React.res.md 生成学习路线图
AI：从 React.res.md 中识别到以下 6 个知识块... 确认后生成 rdp 文件。
```

### 开始学习

```
用户：我想开始学习 React
AI：你上次学到了 [X]，今天我们继续 [Y]，我会先问你几个问题...
```

### 最佳实践

1. 使用 OpenCode 或 Claude Code 窗口多开，将AGENTS.md复制到目标文件夹下，让Agent只依赖AGENTS和目录资源
2. 使用非思考模型，可以节约时间
3. 多窗口多任务并行，利用AI思考的时候进行加速学习，可以同时学习多个学科多个技能
    ```
    start opencode roadmaps\Go-learning
    start opencode roadmaps\Python-learning
    ```

## 相关项目

- Claude Code —— 本项目基于 Claude Code 的技能系统构建

## 许可证

MIT License
