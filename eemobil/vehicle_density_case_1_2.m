%% Case 3
% parameters in models
% id, sourcelane, targetlane, initial position, initial velocity, ACC model
clc
close all
clear

addpath('./Configurations')

config_count = 10;

global real should_use_legend

figure_size = [10,10,14,8];
f = figure('Units','centimeters', 'Position',figure_size);
hold all;

for index=1:config_count
    should_use_images = false;
    
    load_data_for_case_5
    
    driver = IDModel(struct('a_max',1.2, 'b_max',3, 'v_0',50/3.6, 'T',1.8, 'h_0',1, 'delta',4, 'L',4.2, 'time_to_change_lane',1, 'lane_change_duration',2.0, 'not_paying_attention',[], 'acceleration_threshold',10, 'acceleration_difference_threshold',0.3,'p',0, 'stops',false));

    dataset_helper(driver,index)

    traffic

    %post_processing
 
    %animation
    real = true;
    should_use_legend = true;
    
    vehicle_density_post_processing
    
    clear
end
set(gca,'fontsize',8')
xlabel('t[s]')
ylabel('n[-]')
print('Resources/vehicle_density','-depsc');
