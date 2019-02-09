package com.ycy.mybook.domian;

import java.util.List;

/**
 * @program: MyBook
 * @description:
 * @author: ChangYue
 * @create: 2019-01-29 09:31
 */
public class BookPage<T> {
    private int pageNo;
    private int singlePageSize = 18;
    private List<T> list;
    private long totalNumber;

    public BookPage() {
    }

    public BookPage(int page) {
        this.pageNo = page;
    }

    public int getPageNo() {

        if (pageNo < 0) {
            pageNo = 1;
        }
        if (pageNo > getTotalPagesNumber()) {
            pageNo = getTotalPagesNumber();
        }

        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getSinglePageSize() {
        return singlePageSize;
    }

    public void setSinglePageSize(int singlePageSize) {
        this.singlePageSize = singlePageSize;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public void setTotalNumber(long totalNumber) {
        this.totalNumber = totalNumber;
    }

    public long getTotalNumber() {
        return totalNumber;
    }

    public int getTotalPagesNumber() {
        int totalPages = (int) (totalNumber / singlePageSize);
        if (totalNumber % singlePageSize != 0) {
            totalPages++;
        }
        return totalPages;
    }

    public int getPrevPage() {
        if (isHasPrev()) {
            return getPageNo() - 1;
        }
        return getPageNo();
    }

    public int getNextPage() {
        if (isHasNext()) {
            return getPageNo() + 1;
        }
        return getPageNo();
    }


    public boolean isHasPrev() {
        return getPageNo() > 1;
    }

    public boolean isHasNext() {
        return getPageNo() < getTotalPagesNumber();
    }

    public boolean isHasNextAndNext() {
        return getPageNo() < getTotalPagesNumber();
    }

    public boolean isHasLastPage() {
        return getNextPage() == getTotalPagesNumber();
    }

    public boolean isHasEllipsis() {
        return getTotalPagesNumber() - getPageNo() > 2;
    }


}
