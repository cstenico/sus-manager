from locust import HttpLocust, TaskSet, task

class WebsiteTasks(TaskSet):

    def list_storages(self):
        self.client.get("/local_storages")

    @task
    def list_medicines(self):
        self.client.get("/medicines")

class WebsiteUser(HttpLocust):
    task_set = WebsiteTasks
    min_wait = 20
    max_wait = 5000000
