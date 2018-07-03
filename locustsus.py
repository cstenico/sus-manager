from locust import HttpLocust, TaskSet, task

class WebsiteTasks(TaskSet):
        
    @task
    def list_storages(self):
        self.client.get("/local_storages")
        print "geting local storages"

    @task
    def list_medicines(self):
        self.client.get("/medicines")
        print "geting medicines"


class WebsiteUser(HttpLocust):
    task_set = WebsiteTasks
    min_wait = 5000
    max_wait = 15000