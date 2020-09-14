# Syllabus

. | .
--|--
Course code |		{{ code }}
Course title |		{{ title }}
Instructor |		{% for instructor in instructors %}{{ instructor.name }} {% endfor %}
Email |			{% for instructor in instructors %}{{ instructor.email }} {% endfor %}
Office |			{% for instructor in instructors %}{{ instructor.office }} {% endfor %} by appointment
Credits |			{{ credits.us }} US credits ({{ credits.ects }} ECTS credits)
Module |		{{ module }}	
Term |			{{ term }} 2020-2021
Course level |		{% for l in level %}{{ l }} {% endfor %}
Prerequisites |		{% for pre in prerequisites %}{{ pre }}, {% endfor %}
Course drop	|


## 1. Course Description
### Content
{{ description.content }}

### Relevance
{{ description.relevance }}

## 2. Learning Outcomes
### Key outcomes
By the end of the course, students will be able to

{% for outcome in learning_outcomes %}* {{ outcome }}
{% endfor %}

### Other outcomes
The course will also help develop skills in the following areas.

Learning Area | Learning Outcome
--|--
{% for area in learning_areas %}{{ area.type }} | {% for outcome in area.outcomes %}{{ outcome }}{% endfor %}
{% endfor %}

## 3. Reading List
### Required
{% for reading in readings.required %}* {{ reading }}
{% endfor %} 

### Recommended
{% for reading in readings.recommended %}* {{ reading }}
{% endfor %} 

## 4. Teaching Method and Learning Activities
Learning objectives will be achieved through

{% for method in teaching_methods %}* {{ method }}
{% endfor %}

## 5. Assessment
Grading will be based on the total score out of 100, in line with CEU’s standard grading guidelines.

{% for task in assessments %}* {{ task.description }} ({{ task.weight }} percent)
{% endfor %}

## 6. Technical requirements

{% for tr in technical_requirements %}* {{ tr }}
{% endfor %}

## 7. Topic Outline and Schedule

Session | Topics | Readings
--|--|--
{% for row in outline %}{{ row.session }} | {{ row.topic }} | {{ row.reading }}
{% endfor %}

## 8. Short Bio of the Instructor
{{ instructors[0].bio }}