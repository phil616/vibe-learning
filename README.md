# Vibe Learning 氛围学习

> 利用 AI Agent 进行沉浸式技能学习的工具系统，通过智能体的 Agent 循环帮助你真正掌握特定领域的知识。

## 项目简介

Vibe Learning 是一个基于 AI Agent 的学习系统，它不只是给你答案，而是像一个专业的学习教练一样，通过苏格拉底式提问、费曼学习法等方法，引导你主动思考、真正掌握知识。

![image-20260318142600287](./README.assets/image-20260318142600287.png)

### 核心设计理念

- **工具与数据分离**：本仓库是工具（skills + 协议），学习资料和进度存放在你的私有仓库中
- **内容与路线分离**：知识内容存放在 `.res` 文件中，学习路线和进度存放在 `.rdp` 文件中
- **AI 作为教练而非答案库**：引导思考，不直接给出答案
- **可验证的掌握标准**：每个知识点都有明确的 COVERAGE 检查清单
- **学习状态追踪**：完整记录学习过程和掌握情况

## 项目结构

```
vibe-learning/                          ← 你正在看的仓库（公开工具库）
├── .claude/skills/
│   ├── res-builder/                    # 资源整理技能
│   ├── rdp-builder/                    # 路线图生成技能
│   └── workspace-init/                 # 学习空间初始化技能
├── templates/
│   ├── AGENTS.md                       # 学习教练协议模板
│   └── .gitignore                      # 学习仓库 gitignore 模板
├── examples/                           # 完整示例（计算机网络、Python）
├── install.sh                          # 全局安装脚本 (Linux/macOS)
├── install.ps1                         # 全局安装脚本 (Windows)
└── README.md
```

```
my-learning/                            ← 你的私有学习仓库（由 workspace-init 创建）
├── AGENTS.md                           # 学习教练协议
├── resources/                          # .res.md / .res/ 资源文件
│   ├── Python学习.res.md
│   └── 计算机网络.res/
└── roadmaps/                           # .rdp.md 路线图文件
    ├── Python学习.rdp.md
    └── 计算机网络.rdp.md
```

## 快速开始

### 方式一：全局安装（推荐）

将 skills 安装到用户级别，在**任何仓库**中都可以使用：

**Windows PowerShell：**
```powershell
git clone https://github.com/YourOrg/vibe-learning.git
cd vibe-learning
.\install.ps1
```

**Linux / macOS：**
```bash
git clone https://github.com/YourOrg/vibe-learning.git
cd vibe-learning
chmod +x install.sh && ./install.sh
```

安装完成后，在任意目录对 AI 说「初始化学习空间」即可创建你的私有学习仓库。

### 方式二：直接在本仓库使用

如果不需要分离工具和数据，可以直接在本仓库目录下使用 skills。

### 使用流程

```
1. 初始化学习空间    → 对 AI 说 "初始化学习空间"（或手动复制 templates/）
2. 准备学习材料      → 收集你要学习的原始资料
3. 整理为 res 文件   → 对 AI 说 "帮我整理这份资料"
4. 生成 rdp 路线图   → 对 AI 说 "帮我生成路线图"
5. 开始学习          → AI 自动作为学习教练，引导你逐节点学习
```

## 文件格式规范

### .res.md / .res/ — 资源文件（知识内容）

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

[整理后的知识内容]

### 核心要点
- Python 是解释型语言
- 设计哲学：优雅、明确、简单

### 关键术语
| 术语 | 解释 |
|------|------|
| GIL | 全局解释器锁 |
```

### .rdp.md — 路线图文件（学习索引 + 进度）

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

## Skills 说明

| Skill | 用途 | 触发方式 |
|-------|------|---------|
| **res-builder** | 将原始学习材料整理为规范的 `.res` 文件 | "帮我整理这份资料"、"生成 res 文件" |
| **rdp-builder** | 从 `.res` 文件生成 `.rdp` 学习路线图 | "帮我生成路线图"、"生成 rdp" |
| **workspace-init** | 初始化一个独立的学习空间 | "初始化学习空间"、"创建学习仓库" |

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

## 最佳实践

1. **工具与数据分离**：用本仓库管理 skills（公开），用独立仓库管理学习资料和进度（私有）
2. **全局安装 skills**：运行 install 脚本后，skills 在任何仓库都可用
3. **多窗口并行学习**：利用 AI 思考间隙切换科目，加速学习
    ```
    start opencode my-learning\roadmaps\Go-learning
    start opencode my-learning\roadmaps\Python-learning
    ```
4. **使用非思考模型**：学习对话可用更快的模型，节省等待时间
5. **定期复习**：利用 COVERAGE 和 LOGS 进行间隔复习

## 完整示例

`examples/` 目录包含完整的资源文件和路线图示例，可作为参考：

- `计算机网络.res/` — 6 章节的资源目录示例（含 index.md）
- `计算机网络.rdp.md` — 对应的路线图文件
- `Python学习.rdp.md` — 路线图文件示例（内联内容格式）

## 相关项目

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — 本项目基于 Claude Code 的技能系统构建
- [OpenCode](https://github.com/anthropics/opencode) — 开源的 AI 编程助手，同样支持 skills

## 许可证

MIT License
