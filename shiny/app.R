library(shiny)
library(plotly)
library(dplyr)
library(bslib)
library(RColorBrewer)

# Create dataset
oregon_data <- structure(
  list(
    Year = c(
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L,
      2024L
    ),
    types_of_analysts = c(
      "Operations & Policy Analyst\nProgram Analyst\nResearch Analyst\nFiscal Analyst\nHuman Resource Analyst\nCommunicable Disease Analyst",
      "Operations & Policy Analyst\nProgram Analyst\nDisability Analyst\nHuman Resource Analyst\nResearch Analyst\nFiscal Analyst\nPayroll Analyst",
      "Operations & Policy Analyst\nProgram Analyst\nFiscal Analyst\nHuman Resource Analyst\nResearch Analyst\nPayroll Analyst",
      "Operations & Policy Analyst\nPayroll Analyst\nState Procurement Analyst\nProgram Analyst\nPolicy And Budget Analyst\nFiscal Analyst\nHuman Resource Analyst\nResearch Analyst",
      "Operations & Policy Analyst\nProgram Analyst\nHuman Resource Analyst\nResearch Analyst\nFiscal Analyst",
      "Program Analyst\nOperations & Policy Analyst\nResearch Analyst\nFiscal Analyst\nHuman Resource Analyst\nPayroll Analyst",
      "Operations & Policy Analyst\nProgram Analyst\nHuman Resource Analyst\nPayroll Analyst\nFiscal Analyst\nCommunications System Analyst\nResearch Analyst",
      "Operations & Policy Analyst\nProgram Analyst\nResearch Analyst\nHuman Resource Analyst\nFiscal Analyst",
      "Operations & Policy Analyst\nAppraiser Analyst\nHuman Resource Analyst\nProgram Analyst\nResearch Analyst\nFiscal Analyst",
      "Program Analyst\nOperations & Policy Analyst\nFiscal Analyst\nHuman Resource Analyst\nResearch Analyst",
      "Analyst\nBudget Analyst\nHuman Resources Analyst\nHuman Resources Systems Analyst",
      "Operations & Policy Analyst\nProgram Analyst\nResearch Analyst\nHuman Resource Analyst\nFiscal Analyst\nPayroll Analyst",
      "Operations & Policy Analyst\nProgram Analyst\nHuman Resource Analyst\nFiscal Analyst\nPayroll Analyst",
      "Operations & Policy Analyst\nProgram Analyst\nHuman Resource Analyst\nResearch Analyst\nFiscal Analyst\nPayroll Analyst",
      "Operations & Policy Analyst\nProgram Analyst\nHuman Resource Analyst\nFiscal Analyst\nInvestment Analyst\nPayroll Analyst\nResearch Analyst",
      "Program Analyst\nOperations & Policy Analyst\nFiscal Analyst\nResearch Analyst\nHuman Resource Analyst\nPayroll Analyst",
      "Operations & Policy Analyst\nProgram Analyst\nHuman Resource Analyst\nFiscal Analyst\nPayroll Analyst",
      "Program Analyst\nOperations & Policy Analyst\nHuman Resource Analyst\nResearch Analyst\nFiscal Analyst\nPayroll Analyst\nDisability Analyst",
      "Operations & Policy Analyst\nCommunications System Analyst\nFiscal Analyst\nHuman Resource Analyst\nProgram Analyst\nPayroll Analyst",
      "Program Analyst\nOperations & Policy Analyst\nFiscal Analyst\nHuman Resource Analyst",
      "Utility And Energy Analyst\nOperations & Policy Analyst\nHuman Resource Analyst\nFiscal Analyst\nProgram Analyst",
      "Operations & Policy Analyst\nHuman Resource Analyst\nProgram Analyst\nPayroll Analyst\nFiscal Analyst\nResearch Analyst",
      "Operations & Policy Analyst\nProgram Analyst\nFiscal Analyst\nUtility And Energy Analyst\nHuman Resource Analyst\nResearch Analyst\nPayroll Analyst",
      "Program Analyst\nOperations & Policy Analyst\nHuman Resource Analyst\nFiscal Analyst\nPayroll Analyst\nResearch Analyst",
      "Operations & Policy Analyst\nProgram Analyst\nHuman Resource Analyst\nFiscal Analyst\nResearch Analyst",
      "Operations & Policy Analyst\nRecords Management Analyst\nProgram Analyst\nHuman Resource Analyst\nPayroll Analyst",
      "Lpro Analyst\nSenior Research Analyst\nResearch Analyst",
      "Program Analyst\nOperations & Policy Analyst\nHuman Resource Analyst\nFiscal Analyst\nResearch Analyst",
      "Program Analyst\nOperations And Policy Analyst\nHuman Resource Analyst\nResearch Analyst\nFiscal Analyst",
      "Program Analyst\nFiscal Analyst\nOperations & Policy Analyst\nHuman Resource Analyst\nPayroll Analyst",
      "Human Resource Analyst\nProgram Analyst\nFiscal Analyst\nOperations & Policy Analyst\nPayroll Analyst",
      "Program Analyst\nOperations & Policy Analyst\nHuman Resource Analyst\nFiscal Analyst",
      "Operations & Policy Analyst\nProgram Analyst\nHuman Resource Analyst\nFiscal Analyst",
      "Program Analyst\nResearch Analyst\nOperations & Policy Analyst",
      "Principal Legislative Fiscal Analyst\nLegislative Fiscal Analyst\nSenior Legislative Fiscal Analyst",
      "Editor/Analyst I\nEditor/Analyst Ii\nSenior Editor/Analyst",
      "Operations & Policy Analyst\nFiscal Analyst\nHuman Resource Analyst\nPayroll Analyst\nProgram Analyst",
      "Operations & Policy Analyst\nProgram Analyst\nFiscal Analyst",
      "Program Analyst\nResearch Analyst",
      "Human Resource Analyst\nOperations & Policy Analyst\nResearch Analyst\nFiscal Analyst\nPayroll Analyst\nProgram Analyst",
      "Program Analyst\nFiscal Analyst\nOperations & Policy Analyst"
    ),
    Agency = c(
      "OREGON HEALTH AUTHORITY",
      "HUMAN SERVICES, DEPARTMENT OF",
      "TRANSPORTATION, DEPT OF",
      "ADMINISTRATIVE SRVCS, DEPT OF",
      "EMPLOYMENT DEPT",
      "EDUCATION, DEPT OF",
      "CORRECTIONS, DEPT OF",
      "CONSUMER AND BUS SRVCS, DEPT",
      "REVENUE, DEPARTMENT OF",
      "HOUSING & COMM SRVCS, DEPT OF",
      "JUDICIAL DEPARTMENT",
      "JUSTICE, DEPARTMENT OF",
      "ENVIRONMENTAL QUALITY, DEPT",
      "EARLY LEARNING AND CARE, DEPT OF",
      "OR BUSINESS DEV DEPT",
      "HI-ED COORDINATING COMM",
      "PUBLIC EMPS RETIREMENT SYSTEM",
      "YOUTH AUTHORITY, OREGON",
      "FORESTRY, DEPT OF",
      "EMERGENCY MANAGMENT, DEPT OF",
      "PUBLIC UTILITY COMMISSION",
      "POLICE, OREGON STATE",
      "ENERGY, DEPARTMENT OF",
      "PARKS & RECREATION, DEPT OF",
      "STATE FIRE MARSHALL, OFFICE OF THE",
      "SECRETARY OF STATE",
      "LEGISLATIVE POLICY & RESEARCH COMMITTEE",
      "LIQUOR CONTROL COMMISSION",
      "PUBLIC DEFENSE SERVICES",
      "MILITARY, DEPT OF",
      "FISH & WILDLIFE, DEPT OF",
      "VETERANS AFFAIRS, DEPT OF",
      "AGRICULTURE, DEPT OF",
      "CRIMINAL JUSTICE COMMISSION",
      "LEGISLATIVE FISCAL OFFICER",
      "LEGISLATIVE COUNSEL COMMITTEE",
      "WATER RESOURCES, DEPT OF",
      "LABOR & INDUSTRIES, BUREAU OF",
      "LONG TERM CARE OMBUDSMAN",
      "PUBLIC SAFETY STANDARDS & TRNG",
      "Multiple Agencies"
    ),
    average_analyst_salary = c(
      98120,
      98120,
      99800,
      118390,
      85210,
      98120,
      112780,
      98120,
      102430,
      89420,
      95780,
      97510,
      98060,
      98120,
      113290,
      102430,
      89230,
      98120,
      98120,
      93580,
      107900,
      88580,
      98060,
      97510,
      101910,
      101980,
      119350,
      97510,
      102280,
      87140,
      81160,
      93640,
      102430,
      85100,
      172090,
      98440,
      84860,
      102430,
      98060,
      91070,
      98120
    ),
    total_analysts = c(
      1317,
      1225,
      438,
      252,
      236,
      194,
      171,
      163,
      162,
      148,
      129,
      111,
      105,
      98,
      87,
      85,
      85,
      77,
      72,
      65,
      62,
      61,
      59,
      54,
      52,
      41,
      36,
      33,
      30,
      28,
      27,
      27,
      23,
      21,
      19,
      16,
      14,
      13,
      13,
      12,
      7
    )
  ),
  row.names = c(NA,-41L),
  class = "data.frame"
)

# Function to reformat agency names
reformat_names <- function(x) {
  x <- tolower(x)
  if (grepl(",", x)) {
    parts <- strsplit(x, ",")[[1]]
    x <- paste(trimws(parts[2]), trimws(parts[1]))
  }
  # Custom title case function instead of relying on tools::toTitleCase
  words <- strsplit(x, " ")[[1]]
  words <- sapply(words, function(word) {
    if (!word %in% c("of", "and", "the")) {
      paste0(toupper(substr(word, 1, 1)), substr(word, 2, nchar(word)))
    } else {
      word
    }
  })
  paste(words, collapse = " ")
}

# Filter out Multiple Agencies, reformat names, and sort by total_analysts
oregon_data <- oregon_data %>%
  filter(Agency != "Multiple Agencies") %>%
  mutate(Agency = sapply(Agency, reformat_names)) %>%
  arrange(desc(total_analysts))

ui <- page_fluid(
  theme = bs_theme(version = 5),
  card(
    full_screen = TRUE,
    card_header(
      h3("Viewing the Population of Analysts in the State of Oregon"),
      p(class = "text-muted", 
        paste0("Total count includes any FULL-TIME job classifications with \"analyst\" in the name for the ", 
               oregon_data$Year[1], " fiscal year"))
    ),
    plotlyOutput("barChart", height = "800px"),
    card_footer(
      p(class = "text-muted", 
        "Note: Agencies with 10 or fewer analysts are excluded from this visualization.",
        br(),
        "Data Source: ",
        a(href = "https://data.oregon.gov/Revenue-Expense/Salaries-of-State-Agencies-Multi-Year-Report/4cmg-5yp4/about_data",
          "Oregon.Gov Open Data Portal, Salaries of State Agencies - Multi-Year Report",
          target = "_blank")
      )
    )
  ),
  # Shout out for Shiny Assistant
  div(
    style = "text-align: center; margin-top: 20px; color: #6c757d; font-size: 0.9rem;",
    "This app was made with help and appreciation for ",
    a(
      href = "https://gallery.shinyapps.io/assistant/#",
      "Shiny Assistant",
      target = "_blank",
      style = "text-decoration: none; color: #6c757d; font-weight: bold;"
    ),
    " 💙"
  )
)

server <- function(input, output) {
  output$barChart <- renderPlotly({
    # Create salary bins for a better legend experience
    salary_breaks <- seq(min(oregon_data$average_analyst_salary), 
                         max(oregon_data$average_analyst_salary), 
                         length.out = 6)
    
    # Round the breaks to make them more readable
    salary_breaks <- round(salary_breaks, -3)
    
    # Create a green color palette with discrete steps
    color_palette <- colorRampPalette(c("#e5f5e0", "#31a354"))(100)
    
    p <- plot_ly(
      data = oregon_data,
      x = ~total_analysts,
      y = ~Agency,
      type = "bar",
      orientation = 'h',
      # Use the color for average_analyst_salary
      marker = list(
        color = ~average_analyst_salary,
        colorscale = list(c(0, "#e5f5e0"), c(1, "#31a354")),
        cmin = 80000,  # Set the minimum value for color scale
        cmax = 180000, # Set the maximum value for color scale (slightly above your max of 172000)
        # Replace your existing colorbar configuration in the marker list with this:
        colorbar = list(
          title = "Median Salary",
          tickprefix = "$",
          tickmode = "array",  # Use explicit tick values
          tickvals = c(80000, 100000, 120000, 140000, 160000, 180000),  # Explicit tick values
          ticktext = c("$80k", "$100k", "$120k", "$140k", "$160k", "$180k"),  # Custom labels
          len = 0.5,
          y = 0.01,
          x = 1.25,
          orientation = "v",
          yanchor = "bottom",
          xanchor = "right"
        )
      ),
      # Text that appears on the bars
      text = ~format(total_analysts, big.mark=","),
      # Text that appears in hover tooltip
      hovertext = ~paste("<b>", Agency, "</b>",
                         "<br>Total Analysts:", format(total_analysts, big.mark=","),
                         "<br>Median Salary: $", format(average_analyst_salary, big.mark=",", scientific=FALSE),
                         "<br><b>Analyst Classifications:</b><br>", format(types_of_analysts)),
      hoverinfo = "text",
      textposition = "auto",
      textfont = list(
        size = 14,
        family = "Arial"
      )
    ) %>%
      layout(
        xaxis = list(
          title = "Number of Analysts",
          type = "log",
          tickformat = ",d",
          showticklabels = TRUE,
          tickangle = 0,
          tickvals = c(10, 25, 50, 100, 250, 500, 1000),
          ticktext = c("10", "25", "50", "100", "250", "500", "1,000")
        ),
        yaxis = list(
          title = "",
          automargin = TRUE,
          categoryorder = "array",
          categoryarray = rev(oregon_data$Agency)
        ),
        margin = list(l = 20, r = 20, t = 30, b = 20),  # Increased top margin to accommodate colorbar
        hoverlabel = list(bgcolor = "white", align = "left"),
        uniformtext = list(
          minsize = 12,
          mode = 'show'
        ),
        font = list(
          size = 14
        ),
        autosize = TRUE
      )
    
    p
  })
}

shinyApp(ui = ui, server = server)
