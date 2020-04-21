/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: servanechene <servanechene@student.42.f    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/04/14 19:05:15 by servanechen       #+#    #+#             */
/*   Updated: 2020/04/19 16:57:53 by servanechen      ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <errno.h>


extern size_t	ft_strlen(const char *s);
extern char		*ft_strcpy(char *dst, const char *src);
extern int		ft_strcmp(const char *s1, const char *s2);
extern ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
extern ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
extern  char *	ft_strdup(const char *s1);

int main()
{
	char	*s1 = "Hello World !";
	char	s2[14];
	char	s3[14];
	char	*cmp = "Hello World !";
	char	*buf;
	int		fd;
	char	*up;

	printf("------strlen--&--ft_strlen-----\n");
	printf("str = [%s]\nstrlen = %zu\nft_strlen = %zu\n", s1, strlen(s1), ft_strlen(s1));
	printf("\n------strcpy--&--ft_strcpy-----\n");
	printf("str = [%s]\nstrcpy = [%s]\nft_strcpy = [%s]\n", s1, strcpy(s2, s1), ft_strcpy(s3, s1));
	printf("\n------strcmp--&--ft_strcmp-----\n");
	printf("s1 = [%s] and s2 = [%s]\nstrcmp = [%d]\nft_strcmp = [%d]\n", s1, cmp, strcmp(s1, cmp), ft_strcmp(s1, cmp));
	printf("\n------write--&--ft_write-----\n");
	printf("<--write");
	write(1, s1, strlen(s1));
	printf("\n<--ft_write\n");
	ft_write(1, s1, strlen(s1));
	printf("\n-----------ft_read-----------\n");
	fd = open("text.txt", O_RDONLY);
	if (!(buf = malloc(sizeof(char)*66)))
		return(-1);
	ft_read(fd, buf, 66);
	printf("ft_read = [%s]\n", buf);
	close(fd);
	printf("\n-----------ft_strdup-----------\n");
	up = ft_strdup(buf);
	printf("ft_strdup of the str from ft_read test:\n[%s]\n", up);
	free(up);
	free(buf);
	return(0);
}