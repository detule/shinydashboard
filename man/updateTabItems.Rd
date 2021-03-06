% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tabs.R
\name{updateTabItems}
\alias{updateTabItems}
\title{Change the selected tab on the client}
\usage{
updateTabItems(session, inputId, selected = NULL)
}
\arguments{
\item{session}{The \code{session} object passed to function given to
\code{shinyServer}.}

\item{inputId}{The id of the \code{tabsetPanel}, \code{navlistPanel},
or \code{navbarPage} object.}

\item{selected}{The name of the tab to make active.}
}
\description{
This function controls the active tab of \code{\link{tabItems}} from the
server. It behaves just like \code{\link[shiny]{updateTabsetPanel}}.
}
\examples{
## Only run this example in interactive R sessions
if (interactive()) {

ui <- dashboardPage(
  dashboardHeader(title = "Simple tabs"),
  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    ),
    actionButton('switchtab', 'Switch tab')
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
        h2("Dashboard tab content")
      ),
      tabItem(tabName = "widgets",
        h2("Widgets tab content")
      )
    )
  )
)

server <- function(input, output, session) {
  observeEvent(input$switchtab, {
    newtab <- switch(input$tabs,
      "dashboard" = "widgets",
      "widgets" = "dashboard"
    )
    updateTabItems(session, "tabs", newtab)
  })
}

shinyApp(ui, server)
}
}

