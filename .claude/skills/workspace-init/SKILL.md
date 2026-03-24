---
name: workspace-init
description: |
  在当前目录或指定目录中初始化一个标准的 Vibe Learning 学习空间。
  创建 AGENTS.md 学习教练协议、标准目录结构和 .gitignore。
  学习空间是独立于 vibe-learning 工具仓库的私有仓库，用于存放个人学习资料和路线图。
  触发场景："初始化学习空间"、"创建学习仓库"、"新建学习项目"、"setup workspace"、
  "我想开始学习一个新科目"（当用户所在目录不是 vibe-learning 仓库本身时）。
---

# Workspace Init

在目标目录中初始化一个完整的 Vibe Learning 学习空间。

**核心理念：工具与数据分离。**
vibe-learning 仓库是工具（skills + 协议），学习空间是数据（资源 + 路线图 + 进度）。
本 skill 帮助用户快速搭建一个独立的学习空间。

---

## 执行步骤

### 第一步：确认目标目录

询问用户要在哪个目录初始化学习空间：

```
你想在哪个目录创建学习空间？
1. 当前目录（如果当前目录是空的或新建的仓库）
2. 指定一个路径

学习空间会包含 AGENTS.md 教练协议、标准目录结构和 .gitignore。
```

如果用户指定路径且目录不存在，创建该目录。
如果目标目录已包含 AGENTS.md，询问是否覆盖。

### 第二步：创建目录结构

在目标目录下创建以下结构：

```
<workspace>/
├── AGENTS.md           ← 学习教练 AI 行为协议
├── .gitignore          ← Git 忽略规则
├── resources/          ← 存放 .res.md 和 .res/ 资源文件
│   └── .gitkeep
└── roadmaps/           ← 存放 .rdp.md 路线图文件
    └── .gitkeep
```

### 第三步：写入 AGENTS.md

将 `references/workspace-template.md` 中的 AGENTS.md 模板内容写入目标目录的 `AGENTS.md`。

**注意**：直接读取引用文件中 `<!-- AGENTS_START -->` 和 `<!-- AGENTS_END -->` 之间的内容。

### 第四步：写入 .gitignore

```
# === OS ===
.DS_Store
Thumbs.db
Desktop.ini

# === Editor / IDE ===
.vscode/
.idea/
*.swp
*.swo
*~

# === Temporary ===
*.tmp
*.bak
*.log
```

### 第五步：创建 .gitkeep 占位文件

在 `resources/` 和 `roadmaps/` 中各创建一个空的 `.gitkeep` 文件，确保空目录能被 git 跟踪。

### 第六步：可选 — 初始化 Git 仓库

如果目标目录不是 git 仓库，询问用户是否需要初始化：

```
目标目录还不是 git 仓库。是否执行 git init？（推荐：是）
```

若用户同意，执行 `git init` 并创建首次提交。

---

## 完成后输出

```
✅ 学习空间已初始化：<目标路径>

目录结构：
  AGENTS.md        ← 学习教练协议（已就绪）
  .gitignore       ← Git 忽略规则（已就绪）
  resources/       ← 资源文件存放处（空）
  roadmaps/        ← 路线图存放处（空）

下一步：
  1. 准备学习材料 → 使用 res-builder skill 整理为 .res 文件，存放到 resources/
  2. 生成路线图   → 使用 rdp-builder skill 从 .res 文件生成 .rdp.md，存放到 roadmaps/
  3. 开始学习     → 打开 roadmaps/ 目录，AI 会自动作为学习教练引导你
```

---

## 多科目学习空间示例

一个学习空间可以包含多个科目：

```
my-learning/
├── AGENTS.md
├── .gitignore
├── resources/
│   ├── Python学习.res.md
│   ├── 计算机网络.res/
│   │   ├── index.md
│   │   ├── 01-网络概述与体系结构.md
│   │   └── ...
│   └── Go语言.res/
│       ├── index.md
│       └── ...
└── roadmaps/
    ├── Python学习.rdp.md
    ├── 计算机网络.rdp.md
    └── Go语言.rdp.md
```

每个科目独立维护 res 和 rdp 文件，共享同一份 AGENTS.md 教练协议。

模板文件见 `references/workspace-template.md`
