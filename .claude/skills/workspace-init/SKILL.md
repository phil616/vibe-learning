---
name: workspace-init
description: |
  在当前目录或指定目录中初始化一个标准的 Vibe Learning 学习空间。
  创建 AGENTS.md 学习教练协议、标准目录结构和 .gitignore。
  学习空间是独立 Git 仓库，位于 vibe-learning 的 workspace/<项目名>/ 下，
  或用户指定的任意路径，用于存放个人学习资料和路线图。
  触发场景："初始化学习空间"、"创建学习仓库"、"新建学习项目"、"setup workspace"、
  "我想开始学习一个新科目"、在 workspace/ 下新建了目录并想配置协议时。
---

# Workspace Init

在目标目录中初始化一个完整的 Vibe Learning 学习空间。

**核心理念：工具与数据分离，学习项目独立建仓。**
vibe-learning 仓库是工具（skills + 协议），每个学习空间是独立的私有 Git 仓库，
位于 `vibe-learning/workspace/<项目名>/`，res 文件和 rdp 文件平铺在项目根目录下。

---

## 执行步骤

### 第一步：确认并锁定目标目录

**若在 vibe-learning 根目录下工作（存在 workspace/ 目录）：**

```
你想创建哪个学习项目？请输入项目名称（例如：go-learning、python-learning）：
```

用户输入项目名后，**立即执行以下操作锁定路径：**

1. 创建目录：`workspace/<用户输入的项目名>/`
2. 用命令回读实际创建的目录名：
   ```bash
   ls workspace/          # Linux/macOS
   dir workspace/         # Windows
   ```
3. 从命令输出中找到刚创建的目录，以**文件系统返回的实际名称**为准（防止大小写或编码问题）
4. 将此名称作为本次操作的锁定路径，后续所有步骤均使用该名称

若目录已存在，提示用户确认是否继续（不会覆盖已有文件），然后同样以 `ls` 结果确认目录名。

**若在其他任意目录下工作：**

```
你想在哪个目录初始化学习空间？
1. 当前目录（如果当前目录是空的或新建的仓库）
2. 指定一个路径

学习空间会包含 AGENTS.md 教练协议和 .gitignore。
```

如果用户指定路径且目录不存在，创建该目录后用 `pwd`/`cd` 命令读取绝对路径锁定。
如果目标目录已包含 AGENTS.md，询问是否覆盖。

### 第二步：创建目录结构

在目标目录下创建以下**平铺结构**（res 和 rdp 文件直接放在项目根目录，无子目录）：

```
workspace/<项目名>/          ← 即将成为独立 Git 仓库
├── AGENTS.md               ← 学习教练 AI 行为协议
└── .gitignore              ← Git 忽略规则
```

res 和 rdp 文件在后续使用 res-builder、rdp-builder 时自动生成到此目录，无需预先创建占位目录。

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

### 第五步：初始化 Git 仓库

学习项目**必须是独立的 Git 仓库**（这是它能放在 workspace/ 下而不污染父仓库的前提）。

检查目标目录是否已是 Git 仓库：

```bash
git -C <目标路径> rev-parse --is-inside-work-tree
```

- 若**不是** Git 仓库：直接执行 `git init`，然后执行首次提交：
  ```bash
  git -C <目标路径> init
  git -C <目标路径> add .
  git -C <目标路径> commit -m "init: initialize learning workspace"
  ```
- 若**已是** Git 仓库：跳过，无需询问用户。

---

## 完成后输出

输出时，将所有 `<项目名>` 替换为**第一步 `ls` 命令返回的实际目录名**：

```
✅ 学习空间已初始化：workspace/<实际目录名>/

目录结构：
  workspace/<实际目录名>/AGENTS.md     ← 学习教练协议（已就绪）
  workspace/<实际目录名>/.gitignore    ← Git 忽略规则（已就绪）

  （res 和 rdp 文件在整理资料时自动生成到此目录）

下一步：
  1. 将原始资料放入 vibe-learning/material/
  2. 在 vibe-learning 根目录对 AI 说「帮我整理资料」
     → res 文件将生成到 workspace/<实际目录名>/
  3. 对 AI 说「帮我生成路线图」
     → rdp 文件将生成到 workspace/<实际目录名>/
  4. cd workspace/<实际目录名>，启动 ClaudeCode 或 OpenCode 开始学习
```

---

## 项目目录示例（初始化后的最终形态）

```
workspace/
├── go-learning/             ← 独立 Git 仓库
│   ├── .git/
│   ├── AGENTS.md
│   ├── .gitignore
│   ├── Go语言基础.res.md    ← 由 res-builder 生成
│   ├── Go语言进阶.res/      ← 由 res-builder 生成（多章节格式）
│   │   ├── index.md
│   │   └── 01-goroutine.md
│   ├── Go语言基础.rdp.md    ← 由 rdp-builder 生成
│   └── Go语言进阶.rdp.md    ← 由 rdp-builder 生成
└── python-learning/         ← 另一个独立 Git 仓库
    ├── .git/
    ├── AGENTS.md
    ├── .gitignore
    ├── Python学习.res.md
    └── Python学习.rdp.md
```

每个科目的 res 和 rdp 文件平铺在项目根目录，AGENTS.md 教练协议共享同一份，AI 启动后自动读取所有 rdp 文件感知学习进度。

模板文件见 `references/workspace-template.md`
