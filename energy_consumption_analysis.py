import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Read the CSV file
df = pd.read_csv('energy_consumption_log.csv')

# Preprocessing
df['Algorithm'] = df['File'].apply(lambda x: x.split('.')[0])
df['Language'] = df['File'].apply(lambda x: 'Python' if x.endswith('.py') else 'R')

# Convert Time_elapsed_seconds to float
df['Time_elapsed_seconds'] = df['Time_elapsed_seconds'].apply(lambda x: float(x.split(':')[1]))

# Calculate mean values for each algorithm and language
mean_df = df.groupby(['Algorithm', 'Language']).agg({
    'Energy_pkg_Joules': 'mean',
    'Energy_psys_Joules': 'mean',
    'Time_elapsed_seconds': 'mean',
    'Memory_used_kb': 'mean'
}).reset_index()

# Set up the plotting style
plt.style.use('ggplot')
sns.set_palette("Set2")

# Create individual plots for each metric with absolute values
metrics = ['Energy_pkg_Joules', 'Energy_psys_Joules', 'Time_elapsed_seconds', 'Memory_used_kb']
for metric in metrics:
    plt.figure(figsize=(12, 6))
    sns.barplot(x='Algorithm', y=metric, hue='Language', data=mean_df)
    plt.title(f'{metric.replace("_", " ").title()} Comparison')
    plt.ylabel(metric)
    plt.xlabel('Algorithm')
    plt.xticks(rotation=45)
    plt.legend(title='Language')
    plt.tight_layout()
    plt.show()

# Create normalized data
normalized_data = []
for algo in mean_df['Algorithm'].unique():
    algo_data = mean_df[mean_df['Algorithm'] == algo]
    for metric in metrics:
        python_value = algo_data[algo_data['Language'] == 'Python'][metric].values[0]
        r_value = algo_data[algo_data['Language'] == 'R'][metric].values[0]
        min_value = min(python_value, r_value)
        normalized_data.append({
            'Algorithm': algo,
            'Metric': metric,
            'Python': python_value / min_value,
            'R': r_value / min_value
        })

normalized_df = pd.DataFrame(normalized_data)

# Save the normalized results to a CSV file
normalized_df.to_csv('normalized_results.csv', index=False)
print("Normalized results have been saved to 'normalized_results.csv'")