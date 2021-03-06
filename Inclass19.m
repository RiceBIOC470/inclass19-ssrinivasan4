%In class 19

%GB comments
1A 100
1B 100
1C 100
2. 100
Overall 100


% Problem 1. Imagine a clincal trial for two drugs that are intended to lower
% cholesterol. Assume 30 subjects are randomly divided into 3 groups that
% either receive a placebo or one of the two treatments. The mean initials
% levels of total cholesterol in each group are the same. The final
% measurements look like

placebo = [   194   183   199   189   189   214   212   186   191   190];
treatment1 = [    138   217   188   126   249   217   255   196   279   123];
treatment2 =[   152   152   151   143   161   142   142   141   161   135];

data=[placebo, treatment1, treatment2];
groups=[repmat({'placebo'}, 1,10), repmat({'treatment1'}, 1,10), repmat({'treatment2'}, 1,10)];

%A. Make a bar plot of the means of each group with errorbars (Hint, use
%bar and then use 'hold on' and then errorbar). 
means=[mean(placebo), mean(treatment1), mean(treatment2)];
err=[std(placebo)/sqrt(length(placebo)), std(treatment1)/sqrt(length(treatment1)), std(treatment2)/sqrt(length(treatment2))];

figure;
bar(means);
hold on;
errorbar(means, err);
hold off;


%B. Run a one way ANOVA analysis to see whether any of the treatment groups showed
%a statistically signficant difference. 

[p, table, stats] = anova1(data, groups);

%C. use the multcompare function to look at all pairs of samples and
%indicate which are significantly different. 

multcompare(stats);


%Problem 2. In this directory, you will find a .mat file with three
%variables, xdat, ydat, and ydat2. For each pair (xdat, ydat) and (xdat,
%ydat2), fit the data to a first, second and third order polynomial. Which
%one is the best fit in each case? In at least one of the cases, do the
%problem with both the polyfit/polyval functions and with the 'fit' function.
data=load('data.mat');

[coeff, s]= polyfit(data.xdat, data.ydat, 1);
plot(data.xdat, data.ydat, 'r.', 'MarkerSize', 24);
hold on;
plot(data.xdat, polyval(coeff, data.xdat), 'k-', 'LineWidth', 3);
hold off;

[coeff, s]= polyfit(data.xdat, data.ydat, 2);
plot(data.xdat, data.ydat, 'r.', 'MarkerSize', 24);
hold on;
plot(data.xdat, polyval(coeff, data.xdat), 'k-', 'LineWidth', 3);

[coeff, s]= polyfit(data.xdat, data.ydat, 3);
plot(data.xdat, data.ydat, 'r.', 'MarkerSize', 24);
hold on;
plot(data.xdat, polyval(coeff, data.xdat), 'k-', 'LineWidth', 3);
hold off;

%the first order polynomial is the best fit for xdat and ydat

[coeff2, s2]= polyfit(data.xdat, data.ydat2, 1);
plot(data.xdat, data.ydat2, 'r.', 'MarkerSize', 24);
hold on;
plot(data.xdat, polyval(coeff2, data.xdat), 'k-', 'LineWidth', 3);
hold off;

[coeff2, s2]= polyfit(data.xdat, data.ydat2, 2);
plot(data.xdat, data.ydat2, 'r.', 'MarkerSize', 24);
hold on;
plot(data.xdat, polyval(coeff2, data.xdat), 'k-', 'LineWidth', 3);
hold off;

[coeff2, s2]= polyfit(data.xdat, data.ydat2, 3);
plot(data.xdat, data.ydat2, 'r.', 'MarkerSize', 24);
hold on;
plot(data.xdat, polyval(coeff2, data.xdat), 'k-', 'LineWidth', 3);
hold off;
%using the third order polynomial is the best for xdat and ydat2

fit_out= fit(data.xdat', data.ydat2', 'poly1');
plot(fit_out,data.xdat, data.ydat2);
set(gca, 'FontSize', 24);


