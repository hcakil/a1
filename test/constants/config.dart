

class ConfigTest {
  final String responseBody = """{
  "value": [{"statecode": 0,"tickersymbol": "FBKMZ",
  "name": "Fabrikam, Inc.",
  "websiteurl": "http://www.fabrikaminc.com",
  "address1_composite": "6789 Edwards Ave.Lynnwood, Tennessee 37010United States",
  "numberofemployees": 50,
  "description": "Halka açık şirketimiz 105 yıldır faaliyet gösteriyor. Tekstil sektöründeki 90 yıldan fazla deneyimi sayesinde, tekstil sektöründe benzersiz kalite düzeyi ve ürün grubu seçimi sunan ve en güvenilen isimlerden biriyiz. Dünya genelindeki üretim tesislerimizle, müşterilerimize tüm tekstil ihtiyaçlarında destek sağlayabilecek bir konuma geldik.",
  "openrevenue_date": "2022-08-02T05:39:12Z",
  "address1_stateorprovince": "Tennessee",
  "accountnumber": "100" },
  {
  "statecode": 1,
  "tickersymbol": "FBKMZ",
  "name": "Labor Bilisim",
  "websiteurl": "http://www.fabrikaminc.com",
  "address1_composite": "6789 Edwards Ave.Lynnwood, Tennessee 37010 United States",
  "numberofemployees": 50,
  "description": "Trey Research, tam olarak birleştirilmiş cihazların yanında özel devre kartları üreticisidir ve hızlı geri dönüşleri ve kaliteli ürünleri, özel bir fiyata zamanında teslim etmesiyle ünlüdür. Trey Research, iş gücüyle ilgilenmekle gurur duyuyor ve üretim tesislerindeki son teknoloji kafeteryalara büyük oranda yatırım yapmıştır.",
  "openrevenue_date": "2022-08-02T05:39:12Z",
  "address1_stateorprovince": "Tennessee",
  "accountnumber": "1"
  }

  ]
}""";

  final String responseTokenBody = """
  {
    "token_type": "Bearer",
    "scope": "user_impersonation",
    "expires_in": "4652",
    "ext_expires_in": "4652",
    "expires_on": "1659436023",
    "not_before": "1659431070",
    "resource": "https://org098c11e5.crm4.dynamics.com",
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiJodHRwczovL29yZzA5OGMxMWU1LmNybTQuZHluYW1pY3MuY29tIiwiaXNzIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvZmIyNjUzN2UtMDMyMy00NjAzLThmN2ItNDhjNTAzNzZhNmI5LyIsImlhdCI6MTY1OTQzMTA3MCwibmJmIjoxNjU5NDMxMDcwLCJleHAiOjE2NTk0MzYwMjMsImFjciI6IjEiLCJhaW8iOiJFMlpnWUhqcSthd3pQL3ZEWTFiN0tXVjN6c1ZLMkhibmJVOS9MV1pjODZiTjQzYjhvc01BIiwiYW1yIjpbInB3ZCJdLCJhcHBpZCI6ImUwZTJkOWRjLTQyMjUtNDRlZS1hZmJkLTM4ZTg4NTdmZmU0NyIsImFwcGlkYWNyIjoiMCIsImZhbWlseV9uYW1lIjoiQ2FraWwiLCJnaXZlbl9uYW1lIjoiSGF6aW0iLCJpcGFkZHIiOiI4NS45Ni4xODAuMTU0IiwibmFtZSI6IkhhemltIENha2lsIiwib2lkIjoiNGJjY2E1MzYtMWIzZS00ZTlmLWIzNDAtMDJlMWU4YzJhNmQxIiwicHVpZCI6IjEwMDMyMDAyMTZEQkExQjYiLCJyaCI6IjAuQVhrQWZsTW0teU1EQTBhUGUwakZBM2FtdVFjQUFBQUFBQUFBd0FBQUFBQUFBQUNVQUE0LiIsInNjcCI6InVzZXJfaW1wZXJzb25hdGlvbiIsInN1YiI6Ikh4bF9ubUVRN2ZJMFRQQWF6RzFJTkRmdlFmS05KNlNFMnRzYnpPNUhQaWciLCJ0aWQiOiJmYjI2NTM3ZS0wMzIzLTQ2MDMtOGY3Yi00OGM1MDM3NmE2YjkiLCJ1bmlxdWVfbmFtZSI6ImhhemltY2FraWwxQGhhemltY2FraWwxLm9ubWljcm9zb2Z0LmNvbSIsInVwbiI6ImhhemltY2FraWwxQGhhemltY2FraWwxLm9ubWljcm9zb2Z0LmNvbSIsInV0aSI6IlNIcGZjYVEwZjBXaTZucjg5V1lTQUEiLCJ2ZXIiOiIxLjAiLCJ3aWRzIjpbIjYyZTkwMzk0LTY5ZjUtNDIzNy05MTkwLTAxMjE3NzE0NWUxMCIsImI3OWZiZjRkLTNlZjktNDY4OS04MTQzLTc2YjE5NGU4NTUwOSJdfQ.oORq_SSUaL9ROr8oPVctMEoVna2pn6YyKIx8bjYcb12MUVtBdYw30ySbwQ7Z3G_qykRT56kTKb5HfImduMNsn9lO8vlHanGmZcwTW4F-wjjo2-6rfrEI6AfiohNuuhm5Kc2PsRnc5VaSPsM6ee1opZQu08n2MjlzNh24QRa_xA2YarsCw5vbHbRmBPXMQTlBtdLB907UoHVeZJFfjCtX0OeOsEl9tydBQzpjAgPCk3ZfgpWgrw2_7iZOUhmG8S8RVrf6q6RQE7FC3CyM6hDxVCZVqpVtKE3sOEc2DflHr5FIyjkFUmoODxrtP6O8jU-rqgxEaBDRkl9A3Z0Y-6PKWA",
    "refresh_token": "0.AXkAflMm-yMDA0aPe0jFA3amudzZ4uAlQu5Er7046IV__keUAA4.AgABAAEAAAD--DLA3VO7QrddgJg7WevrAgDs_wQA9P8sGLp5AfR5na0vPt98s00VrwLBJI-owrHxIPPJe0i29cJufNtn9a2k2cnk7ipWXSyBhTxWrlMmfmTuEYNCvBmqEyeK2B0Ht9EjkL-gIlCp_jkGtI3sajnP0osBZpSBU3gtmOAnchz0afLX0xFSYhUF4runvAs_-40JUm54Iwd7ajQP_vZ8q2muLToGyD9fecb45e7k3zy9_nV73vj1WzP5LhQZUcqE-W9WpTN1NqEkGwuybvFK5lU1GCVX-nPee4JdJvis7tAGnokPJKNQVB0veCcutr8-gJ_tUb7142QNRQv7O07mrXCt-TGKsIHBT-_ZSu7QudQqlJg4nP4YQoW5D3jAIbXD4IP_mRogyg97P0NDfA4zr-3Zsg5HS3BTh_apfcLzTxewHK6fDJf_lP1iWTBtjeeAvnndD-82fmlX99d73JEuBcxjnjRci1zs8bgPMbwTZvf7TjmhBeOuHlWUZTp_dsqZ9c9A9CAYnWnxuheZO-agk0dbOSF1oA7mENn4M4lQdD5R_WAcFkaMdzPNEy7OBJKo4oWOFaJ_i3SERxQ4I-7rLZvT2Db4uxpjt8e61C-TromiG6kWz8vfTe1vvDhBaJjEmHcdKKxFULs3R2z4X-2VPHRvwFazQUi95umhqhYOQ8f6p5WS5BUkdR_JJTKW-8Pq_QcMwndiHthYvUghWqp5LdvUzuo2mu7mwA"
}
  """;


  final String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiJodHRwczovL29yZzA5OGMxMWU1LmNybTQuZHluYW1pY3MuY29tIiwiaXNzIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvZmIyNjUzN2UtMDMyMy00NjAzLThmN2ItNDhjNTAzNzZhNmI5LyIsImlhdCI6MTY1OTQzMTA3MCwibmJmIjoxNjU5NDMxMDcwLCJleHAiOjE2NTk0MzYwMjMsImFjciI6IjEiLCJhaW8iOiJFMlpnWUhqcSthd3pQL3ZEWTFiN0tXVjN6c1ZLMkhibmJVOS9MV1pjODZiTjQzYjhvc01BIiwiYW1yIjpbInB3ZCJdLCJhcHBpZCI6ImUwZTJkOWRjLTQyMjUtNDRlZS1hZmJkLTM4ZTg4NTdmZmU0NyIsImFwcGlkYWNyIjoiMCIsImZhbWlseV9uYW1lIjoiQ2FraWwiLCJnaXZlbl9uYW1lIjoiSGF6aW0iLCJpcGFkZHIiOiI4NS45Ni4xODAuMTU0IiwibmFtZSI6IkhhemltIENha2lsIiwib2lkIjoiNGJjY2E1MzYtMWIzZS00ZTlmLWIzNDAtMDJlMWU4YzJhNmQxIiwicHVpZCI6IjEwMDMyMDAyMTZEQkExQjYiLCJyaCI6IjAuQVhrQWZsTW0teU1EQTBhUGUwakZBM2FtdVFjQUFBQUFBQUFBd0FBQUFBQUFBQUNVQUE0LiIsInNjcCI6InVzZXJfaW1wZXJzb25hdGlvbiIsInN1YiI6Ikh4bF9ubUVRN2ZJMFRQQWF6RzFJTkRmdlFmS05KNlNFMnRzYnpPNUhQaWciLCJ0aWQiOiJmYjI2NTM3ZS0wMzIzLTQ2MDMtOGY3Yi00OGM1MDM3NmE2YjkiLCJ1bmlxdWVfbmFtZSI6ImhhemltY2FraWwxQGhhemltY2FraWwxLm9ubWljcm9zb2Z0LmNvbSIsInVwbiI6ImhhemltY2FraWwxQGhhemltY2FraWwxLm9ubWljcm9zb2Z0LmNvbSIsInV0aSI6IlNIcGZjYVEwZjBXaTZucjg5V1lTQUEiLCJ2ZXIiOiIxLjAiLCJ3aWRzIjpbIjYyZTkwMzk0LTY5ZjUtNDIzNy05MTkwLTAxMjE3NzE0NWUxMCIsImI3OWZiZjRkLTNlZjktNDY4OS04MTQzLTc2YjE5NGU4NTUwOSJdfQ.oORq_SSUaL9ROr8oPVctMEoVna2pn6YyKIx8bjYcb12MUVtBdYw30ySbwQ7Z3G_qykRT56kTKb5HfImduMNsn9lO8vlHanGmZcwTW4F-wjjo2-6rfrEI6AfiohNuuhm5Kc2PsRnc5VaSPsM6ee1opZQu08n2MjlzNh24QRa_xA2YarsCw5vbHbRmBPXMQTlBtdLB907UoHVeZJFfjCtX0OeOsEl9tydBQzpjAgPCk3ZfgpWgrw2_7iZOUhmG8S8RVrf6q6RQE7FC3CyM6hDxVCZVqpVtKE3sOEc2DflHr5FIyjkFUmoODxrtP6O8jU-rqgxEaBDRkl9A3Z0Y-6PKWA";
}
