from locust import HttpLocust, TaskSet, task
import resource

resource.setrlimit(resource.RLIMIT_NOFILE, (999999, 999999))

class WebsiteTasks(TaskSet):

    @task
    def list_storages(self):
        self.client.get("/local_storages")

    @task
    def list_medicines(self):
        self.client.get("/medicines")

class WebsiteUser(HttpLocust):
    task_set = WebsiteTasks
    min_wait = 20
    max_wait = 5000000
