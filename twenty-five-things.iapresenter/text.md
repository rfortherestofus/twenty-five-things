# 25 Things You Didn't Know You Could Do with R

Hi, I'm David Keyes and I run R for the Rest of Us. I'm excited to be here today and to talk with you about doing things in R you didn't know you could do. Twenty-five things to be precise. 

I find it ironic in many ways that I am up here talking to you about unique ways to use R. I say that because for a long time I didn't feel like a "real" R user. You see, I don't come from a typical R background. I'm a qualitative researcher with a PhD in anthropology. I don't have advanced training in statistics. When I started using R I felt like I wasn't a real R user because the most complicated stats I calculated were descriptive stats. 

But eventually I realized that R isn't just about stats. Or, more precisely, R can do more than just complicated statistical techniques. Eventually, I learned to use R for things like data visualization, reproducible reporting, map making, and much more. R became my Swiss Army knife, enabling me to do anything I needed to with data.

And when I started talking with others about how I used R, they were, to my surprise, quite interested. Eventually, I came to peace with how I used R. I didn't need to do complicated statistics to be a real R user. And, in fact, even among people who do use R for complicated stats, R's capabilities as a more general purpose tool are extremely appealing. My goal today is to show you a few things that you can do with R that you may never have considered.  

Now, before I get started, just one thing: not everything you hear me talk about today is going to be new to you. It's impossible to choose twenty-five things that no one in a group of this size will be familiar with. But my hope is that you come away with at least some new ideas for ways you can use R that you never previously considered. 

---

# Accessing Data

Before you do any work in R, you need data. Let's begin by talking about ways that you can access data directly from R. 

---

## 1. Work with API packages: googlesheets4

As a social scientist, I conduct a lot of surveys. Now that I use R, one of my favorite ways to conduct surveys is with Google Forms. Using Google Forms allows me to put survey responses directly into Google Sheets. And having data in Google Sheets allows me to use the {googlesheets4} package to access that data directly from R. 

{googlesheets4} allows you to connect directly to a Google Sheet and pull in data from it. This means that every time a new response comes in, it just takes you rerunning your code in order to create new analysis, data viz, etc. 

**Resources**
- Book chapter

---

## 2. Work with API packages: qualtrics

Another common tool for those collecting surveys is Qualtrics. And, fortunately for you, if you use Qualtrics, there is a package to bring in data directly from it. With the TODO function, you can bring in data from a Qualtrics survey, ensuring you are always working with the most up-to-date data. 

---

## 3. Work with API packages: tidycensus

A third way that I like to connect directly to my data source is with the {tidycensus} package. I work with a lot of data from the Census Bureau and before I used R, I would spend hours on the Census Bureau website, finding the data I needed, downloading it, and then working with it in Excel. But with the {tidycensus} package, I can connect directly to the Census Bureau, pulling in data on command. 

This approach has proven particularly helpful in my work on the annual Oregon by the Numbers report, which relies heavily on data from the American Community Survey. 

TODO: Add code showing creation of population density map


---

## 4. Work with APIs directly with httr2

Under the hood, the {googlesheets4}, {qualtRics}, and {tidycensus} packages connect to data sources through APIs. Fortunately for us, they hide the often complicated work of accessing data through APIs. Unfortunately for us, there are times when we need to access data available through APIs, but without a wrapper package to simplify the process. 

In this case, the {httr2} package enables us to connect directly with APIs. For example, I 

TODO: Add example from dashboard (CK?)

---

## 5. Scrape data with {rvest}

There are other times when we want to access data and is there is no package to access it, nor is there an API to enable us to connect to the data source. In this case, we often need to scrape data from webpages. 

The {rvest} package is your friend in this case. 

TODO: Add example

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

One thing that I'm guessing everyone here has done is made data visualization with ggplot. What if I told you that you could turn your static plots into interactive plots with just a few lines of code? That's exactly what I do with the {ggiraph} package.

TODO: Add code example

---

# Maps

---

## 8. Make maps

R is renowned for its graph-making capabilities. Did you know that you can use ggplot, that same package you use to make graphs, to make maps. There is a special geom (`geom_sf()`) that allows you to make maps. And everything you have learned about ggplot applies to maps too: color and fill scales, themes, and more.

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

When I teach people to use Quarto, I always start with simple outputs: single HTML files, PDFs, and Word documents. But Quarto can make way more than just those. You can build a full website with Quarto, a dashboard, slides, and much more. 

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

---

## 17. Using GitHub Actions to run code on a schedule (e.g. Prosper Portland)

---

## 18. Use fs package to work with files (e.g. how I zip and send all files to Elissa)

---

# LLMs for coding

---

## 19. Use GitHub Copilot or Codeium

---

## 20. Set up a custom GPT to get answers

---

## 21. Use {chores} package to get LLMs to work with your data

---

# LLMs for data analysis

---

## 22. Summarize text

---

## 23. Translate text

---

## 24. Do sentiment analysis on text

---

# 25. Community

---

# Conclusion

---

## "R is a workflow tool that also does some stats"


