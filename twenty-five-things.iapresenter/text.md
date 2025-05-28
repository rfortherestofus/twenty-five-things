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

## 6. Make interactive data viz with {ggiraph}

One thing that I'm guessing everyone here has done is made data visualization with ggplot. What if I told you that you could turn your static plots into interactive plots with just a few lines of code? That's exactly what I do with the {ggiraph} package.

TODO: Add code example

---

## 7. Make a custom ggplot theme

**Resources**
- Jadey blog post
- Book chapter

---

# Maps

---

## 8. Make maps

**Resources**
- Book chapter
- Course

---

## 9. Do geospatial data analysis (e.g. Meijer stores example)

---

# Reporting

---

## 10. Use Quarto

---

## 11. Make wide range of outputs with Quarto

---

## 12. brand.yml

---

## 13. Publish websites online with Netlify


---

## 14. Make multiple websites for stakeholders (like MFF did)



---

## 15. Make PDFs with typst

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


