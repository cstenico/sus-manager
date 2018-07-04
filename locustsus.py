from locust import HttpLocust, TaskSet, task

class WebsiteTasks(TaskSet):

    @task
    def login(self):
        self.client.post("/", {"email":"stenico.camila@gmail.com", "password":"1234"})
        
    @task
    def list_storages(self):
        self.client.get("/local_storages")

    @task
    def list_medicines(self):
        self.client.get("/medicines")
    
    @task
    def list_stocks(self):
        self.client.get("/stocks")

    @task
    def new_patient(self):
        self.client.post("/patients/new", {"name":"camila", "cpf":"44757742843", "telefone":"19988094195"})


class WebsiteUser(HttpLocust):
    task_set = WebsiteTasks
    min_wait = 20000
    max_wait = 50000