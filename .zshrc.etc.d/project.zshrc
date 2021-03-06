alias init-project='mkdir configuration diagram document md scripts; 
cd md; 
echo "# Overview\n"> 0.overview.md;
echo "# Project-manage\n"> 0.project-manage.md;
echo "# Project-manage-for-me\n"> 0.project-manage-for-me.md;
echo "# Announcement\n"> 0.announcement.md;
echo "# Meetings\n"> 0.meetings.md;
echo "# Resource\n"> 0.resource.md;
echo "# Background\n"> 1.background.md;
echo "# Requirement\n"> 1.requirement.md;
echo "# Design\n"> 2.design.md;
echo "# Design-for-me-x\n"> 2.design-for-me-x.md;
echo "# Dev\n"> 3.dev.md;
echo "# Dev-for-me-x\n"> 3.dev-for-me-x.md;
echo "# Test\n"> 4.test.md;
echo "# QA\n"> 5.qa.md;
echo "# QA-issue-x\n"> 5.qa-issue-x.md;
echo "# Deploy\n"> 6.deploy.md;
echo "# Project-review\n"> 9.project-review.md;
echo "# Inbox\n"> 9.inbox.md;
cd ..; 
echo -e "*.generated.*\n*.svg\n*.png\n.output\ndocument\nconfiguration/*.key\nfiles\n" > .gitignore; 
git init; 
git add .; 
git commit -m "init"; '
