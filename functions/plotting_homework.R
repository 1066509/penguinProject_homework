#Script containing functions to plot data

#Function to plot the exploratory plot
plot_initial_fig <- function(penguins_data){
  penguins_data %>%
  ggplot(aes(x = body_mass_g, y = flipper_length_mm, colour = species)) +
  geom_point() +
  scale_color_manual(values = c("purple3", "salmon", "blue")) +
  labs(x = "Body mass (g)", 
       y = "Flipper length (mm)", 
       title = "Relationship between flipper length and body mass, according to species") +
  theme_bw()
}


#Function to save exploratory figure as a png
save_initial_fig_png <- function(penguins_clean_subset, 
                                  filename, size, res, scaling){
  agg_png(filename, 
          width   =  size, 
          height  =  size, 
          units   =  "cm", 
          res = res,
          scaling =  scaling)
  penguins_initial_plot <- plot_initial_fig(penguins_clean_subset)
  print(penguins_initial_plot)
  dev.off()
}


#Function to plot results plot
plot_results_fig <- function(penguins_data){
  penguins_data %>%
    ggplot(aes(x = body_mass_g, y = flipper_length_mm, colour = species)) +
    geom_point() +
    scale_color_manual(values = c("purple3", "salmon", "blue")) +
    geom_smooth(method = "lm", se = FALSE) +  
    labs(x = "Body mass (g)", 
         y = "Flipper length (mm)", 
         title = "Relationship between flipper length and body mass, according to species") +
    theme_bw()
}


#Function to save results figure as a png
save_results_fig_png <- function(penguins_clean_subset, 
                                 filename, size, res, scaling){
  agg_png(filename, 
          width   =  size, 
          height  =  size, 
          units   =  "cm", 
          res = res,
          scaling =  scaling)
  penguins_results_plot <- plot_results_fig(penguins_clean_subset)
  print(penguins_results_plot)
  dev.off()
}
