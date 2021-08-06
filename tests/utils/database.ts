import { getRepository, getConnection } from "typeorm";
import User from "../../src/entities/User";

export async function clearDatabase () {
  await getRepository(User).delete({});
}

