+++
title = "Beginner Tutorial on Personal Website"
Description = "A tutorial for simple portfolio website"
menu = ""
Categories = []
Tags = []
date = "2017-04-18T15:46:31-07:00"

+++

### _*beginner friendly_
<br>

This tutorial will get you a barebones, but acceptable personal website. It is meant as a starting off point. I expect you to journey on and learn more.
<br>
<br>
### Why a Website  

* Your website is your internet ID. Put as much or as little info as you want.

* It is an official place to showcase your work.

* It is a way to get an edge in job hunts, and also really show off your cool projects.

<br>
<br>

_okay let's get to it..._

<br>
<br>
### Set up a new site
<br>

Create a new Github account.

Choose free version. We don't have any valuable things so we don't need private repos (repository is a place where things are stored).

Make a professional username. Please. No kittenSlayer44 or anything like that.

Start a new repo/project. Top left plus sign.

Name it "[your username].github.io".

_When does my site go on the web?_  

> Github contains a program called Github Pages that automatically creates your websitefrom that project you just created. They made it so that it MUST have that name though. Pics below.

_What am I doing?_  

> Github is an online repository. Is useful if you have multiple people working on a project.
> We now have an account on the Github servers, and our project is on it.


![Repo2](/image/170418_repo2.PNG)
TODO: change default size of images
Since this is a new account, it asks to set up your first files and a local repo.  
Click Readme. Write anything. This is the first file in your project.  

_More info_  

> A README is a text file has information about the software that the creator thought that users should know before using. Like a user manual. 
> index.html is a weird name. Why? Because when the browser is looking for html files to generate the page, the html standard says to look for this specific name.

### Overview of the Web

Any monkey can learn to make a website. It won't understand how it all works though. We are not monkeys.

All website live somewhere. It will be on a computer that is connected to the internet.

That computer has a program that can serve the site to people who request it. Hence servers.

Each of these computers has an address, like every house has an address. A domain name is the nickname for it. For example "google.com" instead of "8.8.8.8". Continuing the analogy, that's like calling your house "home" instead of 330 De Neve Dr. Los Angeles, CA 90024.

For us today, our website is going to live on Github's servers.
<br>

### HTML & CSS
Hyper Text - Meaning words can be hyperlinks
Markup Language - A language to mark things up or annotate.

Cascaded Style Sheets - the style of the content

_CSS_  
It is called cascaded because the order of them matters. Later ones will override previous ones which is useful for customizing. Say you use one of many premade CSS. Then you can change little things with just your own CSS. No need to go into their code. 

Imagine you have a rich electronic document with images, colors, cool fonts, and an amazing layout. Wow, a graphic designer probably made this. How would you represent it electronically though?

We could use a PDF or a Word document. Sure. But the web uses HTML and CSS which are lighter (in file size).

Start with plain text. We now have the same words as on our doc.

Our doc has very diverse content though. It has a header, title, images, and different sections. Use HTML (which uses tags like <p>blah</p>) to mark sections of plain text.

We have now told the software (chrome, firefox, ie) what kind of words we have. Use CSS to tell it how to display these words. Color, font, placement, size, etc.

_In Summary_  
HTML will hold your content. CSS will hold your style.
<br>

### Shortest intro to HTML.
<br> 

__HTML element tags__  

We mentioned these "element" tags. They look like this.

~~~html
<div>
HELLLOOOOO
</div>
~~~

Most common elements are:  

* div - generic division  
* h[#] - headers where h1 biggest and people use up to h6 usually  
* p - paragraph  
* a - link  

__Attributes__  
Any element can have attributes.

~~~html
<div class="big">
HELLLOOOO
</div>
~~~
So then in my CSS, I could say any element with big needs to fill the whole screen.
Most common are class and id. Use class is multiple. ID is supposed to be for one thing. 
<br>

### Short intro to CSS

CSS is to add style. It does this by referencing the elements and their attributes. 
It does this with selectors which look like

~~~css
/* this is a comment in CSS */
h1 {
	color: red;
}

.big {
	color: blue;
	font-family: monospace;
}
~~~

First one makes all h1 headings red. Second one makes all elements in the class big fill up their container.

Just know there are different selectors and ways to mix them to target specific parts of your html.

### Our Workflow.

1. Github takes a couple minutes to update its websites.

2. We want to see immediate results, so we develop locally.

3. Create folder mySite in convenient location.

4. Make html "index.html" in it.

5. Get path of "index.html" and put into address bar of browser to view site or you can drag the file to your browser.

6. Change your site.

7. Refresh the page.

It will look like this

![](/image/170423web0)

<br>
### Basics.

One piece at a time.

Copy this template into "index.html". Edit the html file with any text editor.

~~~html
<!DOCTYPE html>
<html>
<head>
	<!-- This is a comment -->
</head>

<body>
	<!-- content goes here -->
	Hello
</body>

</html>
~~~

This is a blank html document. You see the html tags that enclose the head and body. Head holds meta info that doesn't get displayed. Body holds the content.

_More info_

> !DOCTYPE tells the software reading this that it is an html doc. The '!' is fairly common in scripts and web languages to say something is important.

### Get Bootstrap

Bootstrap is premade CSS. The best feature is they make your website display properly on different device sizes.

Add the following code inside the `<head>` tags.
~~~html
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>[title of website]</title>

	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/mycustom.css" rel="stylesheet">
</head>
~~~

Change the title.

Notice we have linked the bootstrap css and custom css sheets.

_More info_

> Our custom is below bootstrap so that it will override. HTML docs are parsed from top to bottom so the latest CSS rules will prevail.
> "min" only means minified which means it has been compressed to make it smaller so the website can load faster.
> The paths we have on right now are relative to the root of our site.

Go on bootstrap website and download bootstrap. You don't need the source, it just has extras.

Find "bootstrap.min.css" and put it in "[path to mySite]/css/". That means make a folder called css in [mySite] and put the .css file into it.

Also make a file called "mycustom.css" and put it in the same folder.

We also need to add bootstrap javascript and jQuery. Add the following right before the `</html>` tag in your "index.html".

~~~html
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
~~~

Then go into the Bootstrap file you downloaded and copy "bootstrap.min.js" into "[mySite]/js/"

It should look like this

![](/image/170423web1)

_More info_

> Javascript add action to our website. JQuery is a javascript library that bootstrap uses. Javascript > Jquery > bootstrap.js.

<br>

### Navbar

Let's use an altered version of the Navbar example from Bootstrap that was inspired by Tania Rascia. I added my own things to make it professional.

~~~html
<nav class="navbar navbar-inverse navbar-static-top"> 
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-example-1" aria-expanded="false">
				<span class="sr-only">Toggle nav</span>
				<span class="gicon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">[my name]</a>
			</div>
		<div class="collapse navbar-collapse" id="nav-example-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href='about'>About</a><li>

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Projects<span class="caret"></span></a>	
					<ul class="dropdown-menu">
						<li><a href="#">Robotics</a></li>
						<li><a href="#">Coding</a></li>
						<li><a href="#">Photography</a></li>
					</ul>
				</li>
				<li><a href='/post'>Posts</a><li>
				<li><a href='/file/[myResume].pdf'>Resume</a><li>
			</ul>
		</div>
	</div>
</nav>
~~~
It looks like a lot. But not that bad. Let's break it down.

_More info_

> The 'a' tags are links. 'href' says where to link to. We have link to places in our website that we have not created yet. "#" or '#' (doesen't matter) is a placeholder. It doesn't link to anywhere.

> 404's happen when links point to things that don't exist. Like we are linking to about, but we haven't created one.

> Another note about linking. Notice our paths are written absolute here. This is because the navbar will be on every page, so you can't do relative paths. The leading '/' means that it will start from the base directory. This won't work on local because the root will be the C:/ drive probably. When it is uploaded onto Github, it will work though. 

> All the weird classes are just key-value pairs. Like class="collapse" means that it is part of the collapse class. This doesn't mean anything by itself. Bootstrap has defined what that means for us in its css and js files.

> Notice for the nave we are writing absolute paths from the root '/'. This is important because the navbar will be on every page so we can't put relative paths. They won't be correct on every page.

Actually Tania Rascia breaks it down quite well. [Tania's Site](https://www.taniarascia.com/what-is-bootstrap-and-how-do-i-use-it/).

### Jumbotron

Jumbotron is like a big ad. Many people use one. Add this into the `<body>` tags.

~~~html
<div class="jumbotron background">
	<div class="container">
		<h1>Welcome to hunt.</h1>
		<p>This is a hugo theme that uses bootstrap and is well commented.</p>
		<br>
		<p><a class="btn btn-primary btn-lg" href="#" role="button">Button!</a></p>
	</div>
</div>
~~~
<br>

### Front page grid

In bootstrap you use rows that contain columns to organize.

It is separated into 12 cols.

Put this into the `<body>` tags of "index.html".


~~~html
<div class="container front-page">
	<div class="row">
		<div class="col-md-4">
			<span class="glyphicon glyphicon-cloud glyphicon-large" aria-hidden="true"></span>
			<h3>About</h3>
			<p>In summary, it's about learning efficiently.</p>
		</div>
		<div class="col-md-4">
			<span class="glyphicon glyphicon-pencil glyphicon-large" aria-hidden="true"></span>
			<h3>Posts</h3>
			<p>Posts about any topic.</p>
		</div>
		<div class="col-md-4">
			<span class="glyphicon glyphicon-plus glyphicon-large" aria-hidden="true"></span>
			<h3>Projects</h3>
			<p>Check out my projects.</p>
		</div>
	</div>
</div>
~~~

Notice how we have three divs each of 4 units wide. That makes up 12 units which will fill up the screen the way bootstrap intended.

_More info_

> col-md-4 is kind of confusing. 'md' means that for medium sized screens, the browser will look for any class with 'md' in it and display that.
> There are
>	* xs  
>	* sm
>	* md
>	* lg
>	* xl

Tania gives a good explanation too.

### Add clickable boxes.

We make each `<div class="col-md-4">` a clickable link.

This messes up the color though, so add this to "mycustom.css".

~~~css
/*clickable-box class properties*/
a .clickable {
	color: white;
}

a .clickable:hover {
	color: red;
}
~~~


So then overall it will look like this.
~~~~html
<div class="container front-page">
	<div class="row">
		<div class="col-md-4">
			<a href="about">
				<div class="clickable">
					<span class="glyphicon glyphicon-cloud glyphicon-large" aria-hidden="true"></span>
					<h3>About</h3>
					<p>In summary, it's about learning efficiently.</p>
				</div>
			</a>
		</div>
		<div class="col-md-4">
		  <a href="post">
				<div class="clickable">
					<span class="glyphicon glyphicon-pencil glyphicon-large" aria-hidden="true"></span>
					<h3>Posts</h3>
					<p>Posts about any topic.</p>
				</div>
			</a>
		</div>
		<div class="col-md-4">
			<a href="#">
				<div class="clickable">
					<span class="glyphicon glyphicon-plus glyphicon-large" aria-hidden="true"></span>
					<h3>Projects</h3>
					<p>Check out my projects.</p>
				</div>
			</a>
		</div>
	</div>
</div>
~~~~

### Some More Styling

Put all of this into "mycustom.css". Remember we want to override bootstrap's css.

Get rid of the spacing at the bottom of the navbar.
~~~css
.navbar {
	margin-bottom: 0;
}
~~~

Change the color of the background and text
~~~css
body {
	background: #3E4649;
	color: white;
}
~~~

Change how the headers look.
~~~css
h1,
h2 {
	font-weight:bold;
}
~~~

Change the jumbotron color and how the text is inside
~~~css
.jumbotron {
	background: #27A967;
	text-align: center;
}
~~~

Change the p's of the jumbotron class.
~~~css
.jumbotron p {
	font-size: 25px;
}
~~~

Change the button look. Tania calls it a ghost button.
~~~css
.btn-primary {
	color: white;
	background-color: transparent;
	border-color: white;
}
~~~

Change how the button looks when you hover over it.
~~~css
.btn-primary:hover {
	color: #27A967;
	background-color: white;
	border-color: white;
}
~~~

Change the navbar color, the color of the navbar link, and how the nav items look when they are hovered.
~~~css

/* navbar */
.navbar-inverse {
	background: #2E2F31;
}

/* navbar links */
.navbar-inverse .navbar-nav li a {
	color: white;
	font-size: 16px;
}

.navbar-inverse .navbar-nav li a:hover {
	background: #27A967;
}
~~~

Change the dropdown menu background, each item in the dropdown menu, and how they look when you hover over them.
~~~css
.dropdown-menu {
	background: #2E2F31;
}

.dropdown-menu li a {
	border: 10px;
}

/* li's of the dropdown of navbar */
.navbar-inverse .navbar-nav .dropdown-menu li a:hover {
	background: #2C463C;
}
~~~

Change how the front-page class items are aligned.
~~~css
.front-page {
	text-align:center;
}

.front-page p {
	margin-bottom: 40px;
}
~~~
### Change Glyph Size

This into CSS.

~~~~css
.glyphicon-large {
	font-size: 40px;
}
~~~~

Notice we already had glyhpicon-large class. Aria-hidden is just a property that affects the look.

~~~~html
<span class="glyphicon glyphicon-cloud glyphicon-large" aria-hidden="true"></span>
~~~~

### Add Resume

Put your resume in "[mySite]/file/"

This line in the nav is what links it and it is already in the "index.html". Make it link to the name of your resume.

~~~~html
<li><a href='file/[myResume].pdf'>Resume</a><li>
~~~~

<br>

### Add an About page

Make an "[mySite]/about/index.html". Add this to it. You may recognize our navbar and
our header and the javascript we added. That's because every page on your website will have these. So use this following as a template for more pages.

If you want to add cool posts about projects. Put those in "[mySite]/post/". Notice that the Post link links to this place. You will also need an "index.html" in the post folder because when you navigate to it. It will look for an index file. Ideally, that will contain links to all of your posts.

~~~html

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
	
		<title>About Me</title> 

		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/mycustom.css" rel="stylesheet">
	</head>

<body>

<nav class="navbar navbar-inverse navbar-static-top"> 
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-example-1" aria-expanded="false">
				<span class="sr-only">Toggle nav</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">Hunt Ma</a>
		</div>
		<div class="collapse navbar-collapse" id="nav-example-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href='/about'>About</a><li>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Projects<span class="caret"></span></a>	
					<ul class="dropdown-menu">
						<li><a href="#">Robotics</a></li>
						<li><a href="#">Coding</a></li>
						<li><a href="#">Photography</a></li>
					</ul>
				</li>
				<li><a href='/post'>Posts</a><li>
				<li><a href='/file/[myResume].pdf'>Resume</a><li>
			</ul>
		</div>
	</div>
</nav>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h1>About Me</h1>
			<p>About meeeeeeeeeeeeeeeeeeeeeeeeeee</p>
		</div>
	</div>
</div>

</body>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</html>
~~~

### Edits You Can Do

Look at "Adding Custom Styles to Bootstrap" on Tania's Site.

To add an image on the front page.

~~~css
/*background image*/

.background {
	background: url('/image/[myPic].JPG') no-repeat center center fixed; 
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
~~~



### Continue to Evolve!

1. You can extend your website into a blog. 
Look into using a Static Site Generator. This site is made using Hugo. There are some pretty good tutorials out there, but to be honest I needed to use multiple ones to really learn how to do it. There's no single, super-complete one out there.

2. Buy your own domain name and attach it to your website. 

_More info_

> All websites need to live somewhere. Ours lives on the Github servers which are actual computers sitting somewheres wired up to the internet. This website just needs an easy name to remember instead of a complicated IP address like 198.162.0.0. This assigning of names to IP addresses is handled by big organizations called Domain Name Registrars.

3. Learn about Github

Google git tutorial and do it. Git is a fast, lightweight program designed to keep a history of your projects on computers. This is a type of _version control_ system. Github is just a website built using this tool to give you a clickable interface and providing online servers to store your projects.

4. HTML and CSS


