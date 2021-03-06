# 部署到 github pages 脚本
# 错误时终止脚本
set -e

git status

# 打包。
hugo -t LoveIt # if using a theme, replace with `hugo -t <YOURTHEME>`

# Add changes to git.

git add .

# Commit changes.
msg="building site $(date)"
if [ $# -eq 1 ]; then
  msg="$1"
fi
git commit -m "$msg"

git push

hugo-algolia -s
