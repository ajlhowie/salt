import boto3

client = boto3.client('sns')    

def send_sns(sns_topic_arn=None,sns_message=None):

    print(client.publish(TopicArn=sns_topic_arn,Message=sns_message))
