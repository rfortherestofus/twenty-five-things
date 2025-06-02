# 25 Things You Didn't Know You Could Do with R

Hi, I'm David Keyes and I run R for the Rest of Us. I'm excited to be here today and to talk with you about doing things in R you didn't know you could do. Twenty-five things to be precise. 

I find it ironic in many ways that I am up here talking to you about unique ways to use R. I say that because for a long time I didn't feel like a "real" R user. You see, I don't come from a typical R background. I'm a qualitative researcher with a PhD in anthropology. I don't have advanced training in statistics. When I started using R I felt like I wasn't a real R user because the most complicated stats I calculated then, and still calculate now, were descriptive stats. 

But eventually I realized that R isn't just about stats. Or, more precisely, R can do more than just complicated statistical techniques. Eventually, I learned to use R for things like data visualization, reproducible reporting, making maps, and much more. R became my Swiss Army knife, enabling me to do anything I needed to with data.

And the more I started talking with others about how I used R, they were, to my surprise, quite interested. Eventually, I came to peace with how I used R. I didn't need to do complicated statistics to be a real R user. And, in fact, even among people who do use R for complicated stats, R's capabilities as a more general purpose tool are extremely appealing. My goal today is to show you a few things that you can do with R that you may never have considered.  

Now, before I get started, just one thing: not everything you will hear me talk about today is going to be new to you. It's impossible to choose twenty-five things that no one in a group of this size will be familiar with. But my hope is that you come away with at least a few new ideas for ways you can use R that you never previously considered. 

---

# Accessing Data

Before you do any work in R, you need data. Let's begin by talking about ways that you can access data directly from R. 

---

## 1. Work with API packages: googlesheets4

As a social scientist, I conduct a lot of surveys. Now that I use R, one of my favorite ways to conduct surveys is with Google Forms. 

**Resources**
- Book chapter

---

/assets/google-form-v2.png
x: left
y: top


---

/assets/google-sheet-v2.png
x: left
y: top

Using Google Forms allows me to put survey responses directly into Google Sheets. 

---


```
library(googlesheets4)

survey_data <-
  read_sheet(YOURSHEETURLHERE)
```

And having data in Google Sheets allows me to use the {googlesheets4} package to access that data directly from R. 

---

/assets/pre-survey-graph.png
x: left
y: top

This means that every time a new response comes in, it just takes you rerunning your code in order to create new analysis, data viz, etc. 

TODO: Add multiple screenshots to show responses in multiple cohorts

**Resources**
- Book chapter

---

## 2. Work with API packages: qualtrics


---

```
library(qualtRics)

survey_data <-
  fetch_survey(surveyID = "YOURSURVEYIDHERE")
```

Another common tool for those collecting surveys is Qualtrics. And, fortunately for you, if you use Qualtrics, there is a package to bring in data directly from it. With the `fetch_survey()` function, you can bring in data from a Qualtrics survey, ensuring you are always working with the most up-to-date data. 

---

## 3. Work with API packages: tidycensus

A third way that I like to connect directly to my data source is with the {tidycensus} package. I work with a lot of data from the Census Bureau. 

---


/assets/census-bureau-website.png
x: left
y: top

Before I used R, I would spend hours on the Census Bureau website, finding the data I needed, downloading it, and then working with it in Excel. 

---

But with the {tidycensus} package, I can connect directly to the Census Bureau, pulling in data on command. 

This approach has proven particularly helpful in my work on the annual Oregon by the Numbers report, which relies heavily on data from the American Community Survey. 

TODO: Add code showing creation of population density map

---

## 4. Work with APIs directly with {httr2}

Under the hood, the {googlesheets4}, {qualtRics}, and {tidycensus} packages connect to data sources through APIs. Fortunately for us, they hide the often complicated work of accessing data through APIs. Unfortunately for us, there are times when we need to access data available through APIs, but without a wrapper package to simplify the process. In this case, the {httr2} package enables us to connect directly with APIs. 

---

/assets/dashboard.png
x: left
y: top

For example, I have an internal dashboard I use to pull in data from multiple sources. 

---

```
fathom_api_key <- Sys.getenv("FATHOM_API_KEY")

request("https://api.usefathom.com/v1/aggregations") |>
    req_url_query(
      entity = "pageview",
      aggregates = "visits,uniques,pageviews",
      field_grouping = "pathname",
      date_grouping = "month",
      sort_by = "visits:desc",
      limit = 1000
    ) |>
    req_headers(
      Authorization = str_glue("Bearer {fathom_api_key}")
    ) |>
    req_perform()
```

Since few of these tools have dedicated R packages, I write code to connect to them directly. 


---

## 5. Scrape data with {rvest}

There are other times when we want to access data and is there is no package to access it, nor is there an API to enable us to connect to the data source. In this case, we often need to scrape data from webpages. The {rvest} package is your friend in this case. 

---

/assets/world-cup-finals.png
x: left
y: top



---

```
library(tidyverse)
library(rvest)

read_html("https://en.wikipedia.org/wiki/List_of_FIFA_World_Cup_finals") |>
  html_elements("table") |>
  pluck(4) |>
  html_table()
```

---

```
# A tibble: 23 × 8
    Year Winners      Score        `Runners-up`   Venue                       Location               Attendance Ref.    
   <int> <chr>        <chr>        <chr>          <chr>                       <chr>                  <chr>      <chr>   
 1  1930 Uruguay      4–2          Argentina      Estadio Centenario          Montevideo, Uruguay    68,346     [7][8]  
 2  1934 Italy        2–1 (a.e.t.) Czechoslovakia Stadio Nazionale PNF        Rome, Italy            55,000     [9][10] 
 3  1938 Italy        4–2          Hungary        Stade Olympique de Colombes Paris, France          45,000     [11][12]
 4  1950 Uruguay      2–1[n 3]     Brazil         Maracanã Stadium            Rio de Janeiro, Brazil 173,850    [13][14]
 5  1954 West Germany 3–2          Hungary        Wankdorf Stadium            Bern, Switzerland      62,500     [15][16]
 6  1958 Brazil       5–2          Sweden         Råsunda Stadium             Solna, Sweden          49,737     [17][18]
 7  1962 Brazil       3–1          Czechoslovakia Estadio Nacional            Santiago, Chile        68,679     [19][20]
 8  1966 England      4–2 (a.e.t.) West Germany   Wembley Stadium             London, England        96,924     [21][22]
 9  1970 Brazil       4–1          Italy          Estadio Azteca              Mexico City, Mexico    107,412    [23][24]
10  1974 West Germany 2–1          Netherlands    Olympiastadion              Munich, West Germany   78,200     [25][26]
```

---

# Data Viz

---

## 6. Make a custom ggplot theme

If you make plots in ggplot (and if you're here, I'm guessing you do), keeping them consistent and on brand can be challenging. Fortunately, this is where themes come in. If you've never tried to make your own ggplot theme, you should! It's surprisingly simple and with a few lines of code you can ensure that all of your plots are on brand.



**Resources**
- Jadey blog post
- Book chapter

---

## 7. Make interactive data viz with {ggiraph}

What if I told you that you could turn your static plots into interactive plots with just a few lines of code? That's exactly what I do with the {ggiraph} package.

TODO: Add code example

---

# Maps

---

## 8. Make maps

R is renowned for its graph-making capabilities. Did you know that you can use ggplot, that same package you use to make graphs, to make maps? There is a special geom (`geom_sf()`) that allows you to make maps. And everything you have learned about ggplot applies to maps too: color and fill scales, themes, and more.

**Resources**
- Book chapter
- Course

---

## 9. Do geospatial data analysis (e.g. Meijer stores example)

It's not just mapping that you can do in R. If you need to do geospatial analysis in R, that's very possible! While many people think of tools like ArcGIS for geospatial analysis, R is a fully-fledged GIS tool. A client we work with recently asked me to do an analysis of SNAP-Ed program sites within 5 miles of grocery stores. With just a few lines of code, I was able to tell her the sites that met this criteria. This is just one example of how you can use R for geospatial analysis. 

https://github.com/MichiganFitnessFoundation/mff-r-training/issues/74

---

# Reporting

Whatever else you do in R, you need to report your results. As a tool designed for reproducible reporting, R is, of course, incredibly well designed for this purpose. Here are some ways you can improve your reporting in R.

---

## 10. Use Quarto

Yes, David, you may be thinking, I know about using Quarto or its cousin RMarkdown. That may be true for you, but in my years of working with R, I can't tell you how many folks I've met who do not use Quarto. If you are one of these people, or know someone who is, tell them this story:

TODO: Come up with story

---

## 11. Make wide range of outputs with Quarto

When I teach people to use Quarto, I always start with simple outputs: single HTML files, PDFs, and Word documents. But Quarto can go beyond single documents. You can build a full website with Quarto, a dashboard, slides, and much more. 

---

## 12. brand.yml

A recent addition to the Quarto landscape is brand.yml. This framework allows you to add a single file, `_brand.yml`, to your project which lets you specify things like fonts, colors, logos, and more. Keeping your Quarto documents on brand has never been easier!

**Resources**
- brand.yml website
- Podcast with Garrick

---

## 13. Publish websites online with Netlify

Creating reports in Quarto is just the first step. You also need to share them. If you render to some type of HTML output (this can be HTML files, websites, dashboards, slides, and more), you can publish them online. My favorite tool to do this is Netlify. Connect your GitHub repo to Netlify and every time you push updates they will show up online. 

---

## 14. Make multiple websites for stakeholders (like MFF did)

Making a website with Quarto is pretty cool. Making many websites with Quarto is very cool. A client I worked with needed to create separate websites for various organizations they work with. They created a website template and then wrote code to render it multiple times, creating a website for each organization. 

TODO: Clarify details (was it survey?)


---

## 15. Make PDFs with typst

Most people, when they think about making PDFs in Quarto, immediately think Latex. If this is enough to put you off from making PDFs in R, please know there is a new alternative. Known as typst, it is a modern reimagining of Latex. 

**Resources**
- My talk

---

# Automation

---

## 16. Use the {gmailr} or {blastula} package to send reports to stakeholders (e.g. how we did this for Prosper Portland)

In 2020, at the start of the COVID pandemic, we were working with Prosper Portland, the small business development agency for the city of Portland. They had quickly started a grant program for businesses impacted by the pandemic. It was, like so much in those early days of COVID, thrown together quickly. They set up an application form and they wanted an easy way to see a summary of information about businesses seeking relief. We wrote code to pull data from a Google Sheet and create a summary report. And, best of all, we set it up to email the report directly to Prosper Portland staff using the {gmailr} package. 

**Resources**
- https://github.com/rfortherestofus/pp-covid-biz-relief/blob/master/render_gmail.R
- https://pkgs.rstudio.com/blastula/

---

## 17. Using GitHub Actions to run code on a schedule (e.g. Prosper Portland)

When I talked about the daily reports we created for Prosper Portland, I left out one key thing: once we set up the code, we never ran it manually. How did we run the code to pull in the data, render the reports, and email them to Prosper Portland? With GitHub Actions. If you've never heard of GitHub Actions, it's a tool that runs code on your behalf. You add a special YAML file to your GitHub repo and your code runs on a schedule. Magic!

TODO: Show YAML file: https://github.com/rfortherestofus/pp-covid-biz-relief/blob/master/.github/workflows/email_report.yaml

**Resources**
- R for the Rest of Us Blog post
- Albert Rapp blog post

---

## 18. Use fs package to work with files (e.g. how I zip and send all files to Elissa)

Speaking of automation, I often have to move files around. For example, when working on the annual Oregon by the Numbers Report, I make a ton of plots that I have to share with the graphic designer who lays out the report. I used to manually copy all of these files and upload them to Google Drive. But then I came across the {fs} and {zip} packages. I use {fs} to create a list of all the files I've created, which I then pass to the {zip} package in order to create a zip file. And, if I'm feeling extra fancy, I upload the zip file automatically to Google Drive using the {googledrive} package. With all of this, I just have to run my code and share a single link with the designer.

**Resources**
- 250 plots blog post
- https://albert-rapp.de/posts/36_fs_package/

---

# LLMs for coding

Let's finish off by talking about ways that you can use large language models when working with R. Now I'm not an AI hype boy here to tell you that this or that model will blow your mind. And, to be honest, I'm actually a bit hesitant to discuss AI at all because what I tell you today may already be out of date. That said, I think there are some foundational ways that you can use LLMs that will stand the test of time. 


---

## 19. Set up a custom GPT to get answers

My initial foray into using LLMs to work with code was, as I suspect was the case for many of you, through asking ChatGPT questions. And, like many of you, I found its answers at times incredibly helpful and at other times incredibly maddening. Sometimes it would give me base R code, other times tidyverse code. What I came to realize is that I needed to give it detailed instructions on what I wanted. And the best way to do this is to create custom instructions. Now, every time I ask an R question to an LLM, I do it with the following instructions:

> Please answer the following R question. When I program, I always like to use the tidyverse. Please don't ever give me base R solutions. Please also always use the native pipe (|>) not the tidyverse pipe (%>%).

You can paste in instructions like this each time you work with your AI tool of choice. You can create custom GPTs in ChatGPT to save these custom instructions. I use a tool called Raycast for working with LLMs and it has a feature that allows me to create a custom AI prompt with these insturctions.

TODO: Add screenshot of instructions

Every time I have a question for AI, I call up my AI chat preset, which has my instructions embedded in it, and get out answers tailored to my desired style of coding. 

**Resources**
- Simon Couch interview

---

## 20. Use GitHub Copilot or Windsurf

Working with a tool like Raycast or ChatGPT requires you to go outside of your code editor. Another approach is to work with LLMs directly in your editor. If you use RStudio, you can connect directly with GitHub Copilot. If you use Positron, there are a number of extensions you can use to have LLMs interact directly with your code. Whether it's offering suggestions on improving your code, adding new code, or asking general questions about your code, these tools can be extremely helpful.

---

## 21. Use {gander} package to get LLMs to work with your data

A few months ago, I spoke with Posit developer Simon Couch, who is working on a range of R packages to interact with LLMs. Simon has written that:

> Data science differs a bit from software engineering here, though, in that the state of your R environment is just as important (or more so) than the contents of your files. 

In our conversation, Simon explained this further, saying that, when asking a question to an LLM, it's useful if it can see what the objects in your environment look like. The {gander} package solves this problem by passing information about your data frames alongside whatever request you make of an LLM.

**Resources**
- Podcast episode
- https://simonpcouch.github.io/gander/

---

# LLMs for data analysis

LLMs are great for helping you write code to analyze your data. They can also do some of the data analysis for you. 

Now, before anything else, I have to say: please don't rely on LLMs for mission critical analysis without manually reviewing its work. Hallucinations are real.

With that said, the area I have found LLMs to be most helpful is with qualitative data. This data, which is often unstructured, is a perfect candidate for a tool that is comfortable bringing structure to messiness. Here are a few ways you can use it.

---

## 22. Summarize text

If you've ever conducted a survey or simply asked an open-ended question and got more text back than you could analyze by hand, why not try using AI for a quick and dirty analysis? The {mall} package lets you take long text and summarize it down to a shorter length.

TODO: Add example

**References**
- https://mlverse.github.io/mall/#summarize

---

## 23. Translate text

The {mall} package can also translate text. If you get responses in multiple languages, you can easily translate them to English. 

TODO: Add examples

TODO: Show translating text and then summarizing

---

## 24. Create your own prompt

The {mall} package provides some great out-of-the-box prompts you can use. You can also create your own prompts. I've used the {ellmer} package to interact directly with LLMs. 

Here, for example, I created my own function using {ellmer} to identify themes from a set of survey responses. 

TODO: Add example

---

# 25. Join the Community

I've now given you 24 things that you perhaps didn't know you could do with R. All of them are technical. But I'd be remiss if I didn't mention the one thing that you can do with R that is, in fact, the opposite of technical. 

When I started learning R, I never expected to find such a strong, welcoming community. But that's exactly what I've found. R has technical power, sure. But it also has the ability to bring a wide range of people together on a beautiful Saturday to sit all day in an air conditioned room.

You may not have ever considered it, but R can help you find your community. As you learn from others today, I hope that you will consider giving back to maintain and improve the wonderful R community that we all gain so much from. 

That I, a qualitative researcher who, for so long, thought of myself as not being a "real" user am up here today is in no small part because of the encouragement I have received from the R community. It may be a technical tool that brings us together in the first place, but it is the community that keeps us together in the long run. 

---

# Conclusion

---

## "R is a workflow tool that also does some stats"


