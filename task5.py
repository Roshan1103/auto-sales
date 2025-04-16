
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Display basic information and statistics about the training dataset

# Load the datasets
train_df = pd.read_csv(r"C:\Users\rosha\Downloads\train.csv")
test_df = pd.read_csv(r"C:\Users\rosha\Downloads\test.csv")
gender_submission_df = pd.read_csv(r"C:\Users\rosha\Downloads\gender_submission.csv")

# Basic info
print(train_df.info())
print(train_df.describe(include='all'))
print(train_df.head())

# Categorical Columns: 'Sex', 'Embarked', 'Pclass'
print(train_df['Sex'].value_counts())
print(train_df['Embarked'].value_counts())
print(train_df['Pclass'].value_counts())

sns.pairplot(train_df[['Survived', 'Pclass', 'Age', 'SibSp', 'Parch', 'Fare']])
plt.suptitle('Pairplot of Selected Features', y=1.02)
plt.show()

plt.figure(figsize=(10,6))
sns.heatmap(train_df.corr(numeric_only=True), annot=True, cmap='coolwarm', fmt=".2f")
plt.title("Correlation Heatmap")
plt.show()

train_df.hist(figsize=(12,10), bins=20, color='skyblue')
plt.suptitle("Histograms of Numeric Features", fontsize=16)
plt.tight_layout()
plt.show()

sns.boxplot(x='Survived', y='Age', data=train_df)
plt.title('Survival vs Age')
plt.show()

sns.boxplot(x='Survived', y='Fare', data=train_df)
plt.title('Survival vs Fare')
plt.show()


sns.countplot(x='Survived', hue='Sex', data=train_df)
plt.title('Survival by Gender')
plt.show()

sns.countplot(x='Survived', hue='Pclass', data=train_df)
plt.title('Survival by Passenger Class')
plt.show()

sns.countplot(x='Survived', hue='Embarked', data=train_df)
plt.title('Survival by Embarked Port')
plt.show()

