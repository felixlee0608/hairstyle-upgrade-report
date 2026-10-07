# HairStyle Upgrade Report Skill 💇

**AI 发型美学升级报告（Before & After Hairstyle Upgrade Report）智能体技能**

上传一张正面形象照片，即可生成一张横向 4:3 的「高端发型顾问提案板 + 杂志型视觉编排 + 多方案对比 + 轻度避坑感」的个人发型升级报告：左侧 Before 原始发型、右侧 After 主推发型、6 个专业注释点、Key Features 信息栏、4 个推荐方案、3 个避雷方案、底部执行指南。

**核心承诺：发型可换，人必须还是同一个人** —— 不换脸、不磨皮、不换衣服、不靠妆容提升。

---

## ✨ 功能特性

- **身份锁定**：眼睛、鼻子、嘴、耳朵、骨相、年龄感、肤色、识别配件、机位透视全部锁定，"更像本人"永远优先于"更帅"。
- **物理真实发型**：真实发根过渡、自然分缝、细碎飞发、重力垂坠、高光方向与原图一致，杜绝"假发贴图感"。
- **专业提案结构**：Before/After 主视觉 + 6 点编号注释 + Key Features 信息栏 + 4 个推荐方案 + 3 个避雷方案 + Hair Style Guide 执行指南 + 底部免责小字。
- **按脸适配**：根据脸型、发量、发质、额头比例、颈肩比例、打理成本自动判断 After 方向与推荐/避雷发型。
- **自动质检**：生成前 7 项检查 + 生成后 9 项验收，出现身份漂移/假发感/结构缺失自动重做。
- **失败修正**：人物不像 → 只重绘头发区域；发型不自然 → 按 8 维度补细节；假发感 → 强化发根描述。

## 📦 安装

### 方式一：一键安装脚本（macOS / Linux）

```bash
curl -fsSL https://github.com/felixlee0608/hairstyle-upgrade-report/raw/main/install.sh | bash
```

或下载后本地执行：

```bash
bash install.sh
```

脚本会自动检测并安装到以下任一可用目录：

| 智能体 / 环境 | 安装目录 |
|---|---|
| Doubao Work | `~/Library/Application Support/DoubaoWork/.../workspace/.user_skills/` |
| Claude Code | `~/.claude/skills/` |
| OpenAI Codex | `~/.codex/skills/` |
| 通用 Agents（如 QwenWork） | `~/.agents/skills/` 或 `~/.qwenworkcn/skills/` |

### 方式二：手动安装

1. 下载 `hairstyle-upgrade-report-v1.0.0.zip` 并解压。
2. 将整个 `hairstyle-upgrade-report/` 文件夹放入你的智能体技能目录（见上表）。
3. 重启 / 刷新智能体，技能即被识别。

### 环境要求

- 智能体具备图片生成能力（图生图 `image_edit`），推荐使用支持 4:3 横向输出的模型。
- 无需额外依赖、无需 API Key、无需联网（除智能体自身能力外）。

## 🚀 使用

1. 向智能体上传一张**正面形象照片**（多张正面照可提升身份一致性）。
2. 说：**"帮我做一份发型升级报告"**（或"发型提案 / 换发型效果预览 / 发型避雷分析"）。
3. 智能体自动生成 4:3 报告并交付。

可选偏好（直接告诉智能体即可）："更清爽 / 想露额 / 想遮额头 / 要短发 / 想要韩系风格"等。

## 📄 输出规范

- 画幅：横向 4:3。
- 结构：标题区 + Before/After 主视觉 + 6 注释 + 信息栏 + 推荐区(4) + 避雷区(3) + 执行指南 + 底部小字。
- 文字：中文为主、英文作辅助标签，短标签短描述。
- 风格：高级、干净、留白合理，专业顾问感 + 轻度避坑趣味，禁止恶搞。

## 📚 引用与版权

本技能的**提示词模板**源自 **Larus Canus（@MrLarus）** 于 2026 年 4 月 27 日在 X 平台公开发布的《AI 发型美学升级报告提示词》，**原始提示词版权归原作者所有**，仅供学习交流与个人使用。

- 原文链接：https://x.com/MrLarus/status/2048775017287008667
- 推荐引用（GB/T 7714-2015）：Larus Canus. AI 发型美学升级报告提示词（Before & After Hairstyle Upgrade Report）[EB/OL]. (2026-04-27)[2026-10-07]. https://x.com/MrLarus/status/2048775017287008667.

技能的结构化封装、文档与脚本部分参考了 GitHub 开源项目 [portrait-glowup-before-after-skill](https://github.com/weixubo281-code/portrait-glowup-before-after-skill) 与 [hairstyle-transfer-skill](https://github.com/Elias-Lee-SC/hairstyle-transfer-skill) 的设计思路。

## ⚖️ License

- 本仓库的**封装结构、文档与脚本**采用 [MIT License](LICENSE)。
- **提示词模板内容版权归原作者 Larus Canus（@MrLarus）所有**，商用或转载前请自行确认授权。

## 🤝 贡献

欢迎提 Issue / PR 优化提示词、质检规则或安装脚本。请保留原作者署名与引用。
