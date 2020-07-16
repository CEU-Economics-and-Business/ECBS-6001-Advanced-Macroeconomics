from docxtpl import DocxTemplate
from yaml import load

doc = DocxTemplate('syllabus-template.docx')
context = load(open('syllabus.yaml'))
file_name = '-'.join('{} {}'.format(context['code'], context['title']).split())
doc.render(context)
doc.save('{}.docx'.format(file_name))