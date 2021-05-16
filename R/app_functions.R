library(shiny)
library(ggplot2)
library(dplyr)

# Basic placeholder function
placeholder <- function(li = FALSE){
  if(li){
    fluidPage(h3('This is the logged-in UI'))
  } else {
    #UI if the user is not logged in
    fluidPage(h3('This is the logged-out UI'))
  }
}


# Function to conditionally handle UI generation based on (a) logged-in status and (b) access level
make_ui <- function(li = FALSE,
                    ok = fluidPage()){
  if(li){
    ok
  } else {
    # # This is what will get shown if not logged in
    # fluidPage(h3('Please log-in to view this page'),
    #           p('To log-in, click the button in the upper right corner.'))
    NULL
  }
}

# Define function for checking whether logged in, etc.

# Generate the log-in UI
make_log_in_button <- function(li = FALSE){
  if(li){
    actionButton('log_out_button',
                           'Log out',
                           icon = icon('wave'))
  } else {
    actionButton('log_in_button',
                           'Click here to log in',
                           icon = icon('door'))
  }
}

# Log in modal
make_log_in_modal <- function(info_text = NULL){
  showModal(modalDialog(
    title = NULL,
    easyClose = TRUE,
    footer = NULL,
    fade = TRUE,
    fluidPage(
      fluidRow(column(12,
                      align = 'center',
                      h2('Log-in'))),
      fluidRow(column(6,
                      textInput('log_in_user',
                                'Email',
                                placeholder = 'research@hyfe.ai')),
               column(6,
                      passwordInput('log_in_password',
                                    'Password',
                                    placeholder = 'password'))),
      fluidRow(column(12, align = 'center',
                      actionButton('confirm_log_in',
                                   'Log in'))),
      fluidRow(column(12, align = 'center',
                      p(info_text))),
      fluidRow(column(12, align = 'center',
                      p('If you are an authorized project collaborator and do not have log-in credentials, please email who@databrew.cc')))
    )
  ))
}

# Check credentials
credentials_check <- function(user = NULL,
                              password = NULL,
                              users = NULL){
  checks_out <- FALSE
  if(user %in% names(users)){
    correct_password <- users[names(users) == user]
    if(password == correct_password){
      checks_out <- TRUE
    }
  }
  return(checks_out)
}

na_to_zero <- function(x){ifelse(is.na(x), 0, x)}


# Plot theme
theme_who <- ggplot2::theme_bw
