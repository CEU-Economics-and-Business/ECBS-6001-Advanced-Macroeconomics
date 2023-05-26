# Syllabus

. | .
--|--
Course code |		ECBS 6001
Course title |		Advanced Macroeconomics
Instructor |		Miklós Koren 
Email |			korenm@ceu.edu 
Office |			QS B510 (Vienna)  by appointment
Credits |			4 US credits (8 ECTS credits)
Module |		None	
Term |			Fall 2024-2025
Course level |		PhD 
Prerequisites |		Master's level Macroeconomics, 
Course drop	|


## 1. Course Description
### Content
The course introduces Markov processes and dynamic programming, two tools for forecasting dynamic processes and solving dynamic optimization problems. After introducing the key concepts and theoretical results, the tools will be immediately applied in quantitative computing using the Julia programming language.

### Relevance
Markov processes and dynamic programming are key tools to solve dynamic economic problems and can be applied for stochastic growth models, industrial organization and structural labor economics. Julia is an efficient, fast and open source language for scientific computing, used widely in academia and policy analysis.

## 2. Learning Outcomes
### Key outcomes
By the end of the course, students will be able to

* Use difference and differential equations to characterize 2-dimensional dynamic systems.
* Solve for the steady-state of 2-dimensional linear dynamic systems.
* Characterize the stability of 2-dimensional linear dynamic systems.
* Create plots in Julia.
* Understand the definition of Markov processes.
* Create functions in Julia.
* Simulate Markov processes in Julia.
* Understand the definition of Markov chains, both in discrete and continuous time.
* Solve for ergodic distributions of Markov chains.
* Forecast Markov chains analytically.
* Apply arrays and matrix algebra in Julia.
* Simulate Markov chains in Julia.
* Understand the principle of dynamic programming.
* Derive the Bellman equation for several simple recursive problems.
* Derive the Hamilton-Jacobi-Bellman equation for several simple recursive problems in continuous time.
* Solve for the value function using the guess and verify method.
* Solve the Bellman equation using value function and policy function iteration.
* Understand contraction mappings.
* Use while loops in Julia numerical iteration.
* Solve the Ramsey growth model using dynamic programming.
* Solve the Diamond-Mortensen-Pissarides search model using dynamic programming.


### Other outcomes
The course will also help develop skills in the following areas.

Learning Area | Learning Outcome
--|--
Critical thinking | Compare sequential and recursive formulation of dynamic optimization problems. Evaluate the limitations of Markov processes. 
Quantitative reasoning | Use Markov processes for forecasting. 
Technology skills | Install and use basic libraries in the Julia language. Use key programming tools in Julia: functions, loops. 
Interpersonal communication skills | Convey difficult concepts verbally. 
Management knowledge and skills | Create software with many components. Organize work components effectively. Meet deadlines. 
Cultural sensitivity and diversity | Work together with students of different backgrounds. 
Ethics and social responsibility |  


## 3. Reading List
### Required
* Ljungqvist, Lars, Thomas J. Sargent. 2018. Recursive Macroeconomic Theory. 4th Edition. MIT Press. (earlier editions are also fine, but chapter numbering may be different)
* Caraiani, Petre. 2019. Introduction to Quantitative Macroeconomics Using Julia: From Basic to State-of-the-Art Computational Techniques. Academic Press. (Note that the code examples in the book use Julia 0.6. We will be using version 1.4, and discuss the necessary changes.)
* Feller, W. 1950. An introduction to probability theory and its applications. Wiley. Chapter 17.
* Achdou, Yves, Francisco J. Buera, Jean-Michel Lasry, Pierre-Louis Lions, and Benjamin Moll. 2014. “Partial Differential Equation Models in Macroeconomics.” Philosophical Transactions. Series A, Mathematical, Physical, and Engineering Sciences 372 (2028). https://doi.org/10.1098/rsta.2013.0397.
* Klette, Tor, and Samuel Kortum. 2004. Innovating Firms and Aggregate Innovation. The Journal of Political Economy 112 (5): 986–1018.
* Luttmer, Erzo. 2011. On the Mechanics of Firm Growth. The Review of Economic Studies 78 (3): 1042-68.
 

### Recommended
* Stachurski, John. 2009. Economic dynamics: theory and computation. MIT Press.
* Sargent, Thomas J. and John Stachurski. 2017. Quantitative economics with Julia [website], https://lectures.quantecon.org/
* Koren, Miklós and Silvana Tenreyro. 2013. “Technological Diversification.” American Economic Review. 103(1), pp. 378-414
* Koren, Miklós and Krisztina Orbán. 2023. Sudden Liberalization and the Baby Boom of Managers. Manuscript.
* Koren, M., Csillag, M. and Köllő, J. 2020. Machines and machinists: Incremental technical change and wage inequality, Technical Report 2020, Department of Economics, Central European University.
 

## 4. Teaching Method and Learning Activities
Learning objectives will be achieved through

* Conceptual lectures.
* Live coding together with instructor.
* Group discussion.


## 5. Assessment
Grading will be based on the total score out of 100, in line with CEU’s standard grading guidelines.

* Class participation (20 percent)
* Take-home problem (40 percent)
* Take-home coding assignment (40 percent)


## 6. Technical requirements

* Personal laptop computer with administrative privileges to install open source software.
* Operating system: Windows 10+ or Mac OS X 10.8+, or Linux 2.6.18+
* Ability to install Julia 1.9, https://julialang.org/downloads/
* Internet access.


## 7. Topic Outline and Schedule

Session | Topics | Readings
--|--|--
Classes 1-2 | Dynamic systems in discrete time | Caraiani (2019), Chapter 3.2. [Stachurski (2009), Chapter 4.1.]
Classes 3-4 | Markov processes | Caraiani (2019), Chapter 1.
Classes 5-6 | Markov chains | Ljungqvist and Sargent (2018), Chapter 2.
Classes 7-10 | Dynamic programming | Caraiani (2019), Chapter 4. Ljungqvist and Sargent (2018), Chapters 3-4.
Classes 11-12 | Dynamic systems in continuous time | 
Classes 13-14 | Continuous-time Markov chains | Feller 1950, Chapter 17
Class 15 | Dynamic equilibrium models with heterogeneous agents | 
Classes 16-17 | Dynamic programming in continuous time | 
Class 18 | General solution methods | Achdou et al (2014)
Classes 19-20 | The Klette-Kortum model of innovation | Klette and Kortum (2004), Koren and Tenreyro (2013)
Classes 21-22 | Growth and firm size | Luttmer (2011), Koren and Orbán (2023)
Classes 23-24 | Search and matching | Ljungqvist and Sargent (2018), Chapter 29. Koren, Csillag and Köllő (2020)


## 8. Short Bio of the Instructor
Miklós Koren is professor of economics at CEU, senior research fellow at the Institute of Economics, and research fellow of the Centre for Economic Policy Research. His research focuses on how talent and technology jointly determine business success. Professor Koren has more than two decades of experience with microeconometrics and quantitative macro modeling. He is a certified Carpentries Instructor.