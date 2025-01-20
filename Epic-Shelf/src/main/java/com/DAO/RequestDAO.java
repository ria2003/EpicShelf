package com.DAO;

import java.util.List;
import com.entity.Request;

public interface RequestDAO {
    boolean addRequest(Request request);
    List<Request> getAllRequests();
    boolean deleteRequest(int requestId);
}
