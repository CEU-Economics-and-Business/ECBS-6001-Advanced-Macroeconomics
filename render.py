from jinja2 import Template
from docxtpl import DocxTemplate
from yaml import load, SafeLoader

doc = DocxTemplate('syllabus-template.docx')
md = Template(open('syllabus-template.md', 'rt').read())
context = load(open('syllabus.yaml'), Loader=SafeLoader)
file_name = '-'.join('{} {}'.format(context['code'], context['title']).split())

# replace NoneType nodes with an empty list
def replace_none(node):
	if isinstance(node, dict):
		for key, value in node.items():
			node[key] = replace_none(value)
	elif isinstance(node, list):
		for i, value in enumerate(node):
			node[i] = replace_none(value)
	elif node is None:
		return []
	return node

context = replace_none(context)

# save .md
with open('{}.md'.format(file_name), 'wt') as file:
	file.write(md.render(context))

# then .docx
doc.render(context)
doc.save('{}.docx'.format(file_name))